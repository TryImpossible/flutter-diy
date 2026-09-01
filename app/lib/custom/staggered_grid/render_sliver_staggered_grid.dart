part of 'staggered_grid_view.dart';

class RenderSliverStaggeredGrid extends RenderSliverMultiBoxAdaptor {
  static const int _geometryBlockSize = 64;
  static const int _maxGeometryWindowSize = 512;
  static const int _maxLayoutCheckpointCount = 32;
  RenderSliverStaggeredGrid({
    required super.childManager,
    required SliverStaggeredGridDelegate delegate,
    required int itemCount,
  }) : _delegate = delegate,
       _itemCount = itemCount,
       assert(itemCount >= 0);
  int _activeCrossAxisCount = 1;

  SliverStaggeredGridDelegate get delegate => _delegate;
  SliverStaggeredGridDelegate _delegate;
  set delegate(SliverStaggeredGridDelegate value) {
    if (identical(_delegate, value)) {
      return;
    }
    // 与 SliverGrid 一致：先判断是否需要重新布局，再始终保存最新委托。
    // 回调闭包的生命周期由调用者控制；闭包引用变化表示布局结果可能变化。
    final bool needsLayout =
        value.runtimeType != _delegate.runtimeType ||
        value.shouldRelayout(_delegate);
    _delegate = value;
    if (needsLayout) {
      _clearLayoutCache();
      markNeedsLayout();
    }
  }

  /// 当前缓存对应的布局几何信息；不持有 Widget 或 RenderBox。
  /// 列表只覆盖当前窗口，滚动时从末尾增量追加，窗口外通过检查点重建。
  List<SliverStaggeredGridGeometry>? _cachedGeometries;

  /// 当前 Geometry 窗口在完整列表中的起始索引。
  int _cachedGeometryStartIndex = 0;

  /// 窗口起点之前已计算内容的最大 trailing offset。
  double _cachedWindowStartScrollExtent = 0;

  /// 当前窗口内 Geometry 的最大 trailing offset。
  double _cachedWindowMaxTrailing = 0;

  /// 每个块的累计最大结束位置，用于二分定位候选块。
  List<double>? _cachedBlockMaxTrailing;

  /// 每个 Geometry 块的范围元数据，用于首尾可见索引的快速筛选。
  List<_SliverStaggeredGridGeometryBlock>? _cachedBlocks;

  /// 跨 performLayout 复用列最小堆；只有列状态整体替换时才重建。
  _SliverStaggeredGridColumnMinHeap? _cachedColumnMinHeap;

  /// Geometry 索引是否需要重建。滚动位置变化本身不会使索引失效。
  bool _geometryIndexesDirty = true;

  /// 按固定数量保留布局检查点，避免 Geometry 缓存随列表长度无限增长。
  final List<_SliverStaggeredGridLayoutCheckpoint> _layoutCheckpoints =
      <_SliverStaggeredGridLayoutCheckpoint>[];

  /// 缓存计算完成时每一列的下一个可用主轴位置。
  List<double>? _cachedColumnOffsets;

  /// 缓存覆盖的 item 数量和完整滚动范围。
  int _cachedItemCount = 0;
  double _cachedScrollExtent = 0;

  /// 当前已计算列中的最大可用主轴 offset。
  double _cachedMaxColumnOffset = 0;

  /// 列表已计算到末尾时保存的精确总滚动范围。
  double? _cachedKnownTotalScrollExtent;

  /// 当前 Geometry 窗口的尺寸聚合值，用于避免重复遍历窗口估算滚动范围。
  double _cachedGeometryExtentSum = 0;
  int _cachedGeometryExtentCount = 0;
  double? _cachedEstimatedScrollExtent;
  int _cachedEstimatedItemCount = -1;

  /// 缓存生成时使用的交叉轴约束快照。
  double? _cachedCrossAxisExtent;
  AxisDirection? _cachedCrossAxisDirection;
  int? _cachedCrossAxisCount;

  /// 清除所有布局缓存，下一次布局会从 index 0 重新计算。
  /// delegate、交叉轴尺寸或方向变化时调用。
  void _clearLayoutCache() {
    _cachedGeometries = null;
    _cachedGeometryStartIndex = 0;
    _cachedWindowStartScrollExtent = 0;
    _cachedWindowMaxTrailing = 0;
    _cachedBlockMaxTrailing = null;
    _cachedBlocks = null;
    _cachedColumnMinHeap = null;
    _geometryIndexesDirty = true;
    _layoutCheckpoints.clear();
    _cachedColumnOffsets = null;
    _cachedItemCount = 0;
    _cachedScrollExtent = 0;
    _cachedMaxColumnOffset = 0;
    _cachedKnownTotalScrollExtent = null;
    _cachedGeometryExtentSum = 0;
    _cachedGeometryExtentCount = 0;
    _cachedEstimatedScrollExtent = null;
    _cachedEstimatedItemCount = -1;
    _cachedCrossAxisExtent = null;
    _cachedCrossAxisDirection = null;
    _cachedCrossAxisCount = null;
  }

  int get crossAxisCount => _activeCrossAxisCount;

  int get itemCount => _itemCount;
  int _itemCount;
  set itemCount(int value) {
    assert(value >= 0);
    if (_itemCount == value) {
      return;
    }
    _itemCount = value;
    // 列表长度变化后，之前记录的完整滚动范围只覆盖旧数据。
    _cachedKnownTotalScrollExtent = null;
    _cachedEstimatedScrollExtent = null;
    _cachedEstimatedItemCount = -1;
    // 布局信息列表必须与新的子节点范围保持一致。
    markNeedsLayout();
  }

  double get mainAxisSpacing => delegate.mainAxisSpacing;

  double get crossAxisSpacing => delegate.crossAxisSpacing;

  IndexedFullSpanBuilder? get fullSpanBuilder => delegate.fullSpanBuilder;

  IndexedMainAxisExtentBuilder get mainAxisExtentBuilder =>
      delegate.mainAxisExtentBuilder;

  @override
  void setupParentData(RenderObject child) {
    // 扩展 SliverMultiBoxAdaptorParentData，保存交叉轴布局字段，供
    // childCrossAxisPosition 和绘制阶段定位子节点使用。
    if (child.parentData is! SliverStaggeredGridParentData) {
      child.parentData = SliverStaggeredGridParentData();
    }
  }

  @override
  double childCrossAxisPosition(RenderBox child) {
    final SliverStaggeredGridParentData childParentData =
        child.parentData! as SliverStaggeredGridParentData;
    return childParentData.crossAxisOffset ?? 0;
  }

  @override
  void performLayout() {
    // 一次布局分为四个阶段：
    // 1. 根据所有索引计算几何位置和总滚动范围；
    // 2. 找出进入视口/缓存范围的首尾索引；
    // 3. 回收范围外子节点，并向前或向后补齐缺失子节点；
    // 4. 汇总 SliverGeometry，告诉外层 Viewport 如何绘制和滚动。
    // RenderObject 不直接创建 Widget，所有创建和回收都通过 childManager 完成。
    final SliverConstraints constraints = this.constraints;
    _activeCrossAxisCount = delegate.getCrossAxisCount(constraints);
    if (_cachedCrossAxisCount != null &&
        _cachedCrossAxisCount != _activeCrossAxisCount) {
      _clearLayoutCache();
    }
    childManager.didStartLayout();
    childManager.setDidUnderflow(false);

    if (itemCount == 0) {
      // 数据源为空时，回收所有仍 attached 的子节点；collectGarbage(0, 0)
      // 只会处理 keep-alive 缓存，无法移除当前子节点链表中的 RenderBox。
      collectGarbage(0, childCount);
      // 空列表不再需要旧索引的几何信息，避免数据清空后继续占用缓存内存。
      _clearLayoutCache();
      geometry = SliverGeometry.zero;
      childManager.didFinishLayout();
      return;
    }

    final double scrollOffset =
        constraints.scrollOffset + constraints.cacheOrigin;
    final double remainingExtent = constraints.remainingCacheExtent;
    final double targetEndScrollOffset = scrollOffset + remainingExtent;
    // cacheOrigin 可能小于零，表示当前布局需要覆盖视口前方的预缓存区域。
    // 因此首尾索引不能只按 paintExtent 判断，而要使用完整 cache 范围。
    final _SliverStaggeredGridLayout layout = _buildLayout(
      constraints,
      scrollOffset,
      targetEndScrollOffset,
    );
    // 只在当前 Geometry 窗口内查询位置，再将视口和缓存范围实例化为 RenderBox。
    final int? firstIndex = _getFirstIndexForScrollOffset(
      layout.geometries,
      scrollOffset,
    );

    if (firstIndex == null) {
      // 滚动位置已经超过最后一个 item 时，清理已有子节点，但仍保留
      // layout.scrollExtent，让外层 ScrollPosition 得到正确的内容总长度。
      if (firstChild != null) {
        collectGarbage(calculateLeadingGarbage(firstIndex: itemCount), 0);
      }
      geometry = SliverGeometry(
        scrollExtent: layout.scrollExtent,
        maxPaintExtent: layout.scrollExtent,
      );
      childManager.didFinishLayout();
      return;
    }

    final int targetLastIndex = _getLastIndexForScrollOffset(
      layout.geometries,
      targetEndScrollOffset,
      firstIndex,
    );

    if (firstChild != null) {
      // 通过 Sliver 子节点管理器回收目标范围前后的子节点，
      // 使内存占用与视口范围大致成正比。
      final int leadingGarbage = calculateLeadingGarbage(
        firstIndex: firstIndex,
      );
      final int trailingGarbage = calculateTrailingGarbage(
        lastIndex: targetLastIndex,
      );
      collectGarbage(leadingGarbage, trailingGarbage);
    } else {
      // 首次布局或所有子节点都被回收后，从目标范围重新建立子节点链表。
      collectGarbage(0, 0);
    }

    final SliverStaggeredGridGeometry firstChildGeometry = layout
        .getGeometryForIndex(firstIndex);
    if (firstChild == null) {
      // addInitialChild 会创建 firstIndex 对应的第一个 RenderBox，并将其
      // 挂到 Sliver 的子节点链表中；失败通常表示 delegate 已无可用子节点。
      if (!addInitialChild(
        index: firstIndex,
        layoutOffset: firstChildGeometry.scrollOffset,
      )) {
        geometry = SliverGeometry(
          scrollExtent: layout.scrollExtent,
          maxPaintExtent: layout.scrollExtent,
        );
        childManager.didFinishLayout();
        return;
      }
    }

    RenderBox? trailingChildWithLayout;
    // 向前滚动时，向 leading edge 补充缺失的子节点。
    for (
      int index = indexOf(firstChild!) - 1;
      index >= firstIndex;
      index -= 1
    ) {
      // 反向滚动时，已有 firstChild 可能位于目标首项之后，需要逐个向链表
      // 头部插入并布局，直到覆盖 firstIndex。
      final SliverStaggeredGridGeometry flowGeometry = layout
          .getGeometryForIndex(index);
      final RenderBox child = insertAndLayoutLeadingChild(
        flowGeometry.getBoxConstraints(constraints),
      )!;
      _applyParentData(child, flowGeometry);
      trailingChildWithLayout ??= child;
    }

    // 没有插入 leading 子节点时，直接布局当前第一个子节点。
    if (trailingChildWithLayout == null) {
      _layoutChild(firstChild!, firstChildGeometry);
      trailingChildWithLayout = firstChild;
    }

    for (
      int index = indexOf(trailingChildWithLayout!) + 1;
      index <= targetLastIndex;
      index += 1
    ) {
      // 向后滚动时，向 trailing edge 补充缓存范围内的子节点。
      // 正向滚动时，从当前链表尾部继续创建子节点，直到覆盖缓存范围末端。
      // 如果 delegate 返回 null，说明暂时无法创建该索引，停止继续扩展。
      final SliverStaggeredGridGeometry flowGeometry = layout
          .getGeometryForIndex(index);
      final BoxConstraints childConstraints = flowGeometry.getBoxConstraints(
        constraints,
      );
      RenderBox? child = childAfter(trailingChildWithLayout!);
      if (child == null || indexOf(child) != index) {
        child = insertAndLayoutChild(
          childConstraints,
          after: trailingChildWithLayout,
        );
        if (child == null) {
          break;
        }
      } else {
        // 与 Flutter RenderSliverGrid 保持一致：RenderBox.layout 会在约束
        // 未变化且子节点不 dirty 时自行短路，同时保证 dirty child 不会被跳过。
        child.layout(childConstraints);
      }
      trailingChildWithLayout = child;
      _applyParentData(child, flowGeometry);
    }

    final double paintExtent = calculatePaintOffset(
      constraints,
      from: math.min(constraints.scrollOffset, firstChildGeometry.scrollOffset),
      to: layout.computedScrollExtent,
    );
    final double cacheExtent = calculateCacheOffset(
      constraints,
      from: firstChildGeometry.scrollOffset,
      to: layout.computedScrollExtent,
    );

    geometry = SliverGeometry(
      // scrollExtent 表示完整内容长度；paint/cache extent 表示当前可见区
      // 以及视口周围需要保留的缓存范围。
      scrollExtent: layout.scrollExtent,
      paintExtent: paintExtent,
      cacheExtent: cacheExtent,
      maxPaintExtent: layout.scrollExtent,
      hasVisualOverflow:
          layout.scrollExtent > paintExtent ||
          constraints.scrollOffset > 0 ||
          constraints.overlap != 0,
    );

    if (targetLastIndex >= itemCount - 1) {
      childManager.setDidUnderflow(true);
    }
    childManager.didFinishLayout();
  }

  _SliverStaggeredGridLayout _buildLayout(
    SliverConstraints constraints,
    double targetStartScrollOffset,
    double targetEndScrollOffset,
  ) {
    // 缓存只复用当前窗口内已经完成的几何计算：滚动位置变化不会触发旧
    // 索引的 Builder，窗口外则从最近检查点恢复列状态后按需重建。
    final bool constraintsChanged =
        _cachedCrossAxisExtent != constraints.crossAxisExtent ||
        _cachedCrossAxisDirection != constraints.crossAxisDirection;
    if (constraintsChanged) {
      _clearLayoutCache();
    }

    if (_cachedItemCount > itemCount) {
      // 删除尾部数据后，旧列状态和滚动范围均可能来自已删除 item。
      // 当前实现采用整体失效，保证不会复用错误的列偏移。
      _clearLayoutCache();
    }

    if (_cachedGeometries == null) {
      _restoreCheckpoint(
        const _SliverStaggeredGridLayoutCheckpoint(
          index: 0,
          columnOffsets: <double>[],
          maxColumnOffset: 0,
          scrollExtent: 0,
        ),
      );
    }

    // 当前目标位于已淘汰窗口之前时，恢复到不晚于目标位置的最近检查点。
    if ((_cachedGeometryStartIndex > 0 &&
            targetStartScrollOffset <= _cachedWindowStartScrollExtent) ||
        (targetStartScrollOffset > _cachedWindowMaxTrailing &&
            _cachedItemCount >= itemCount &&
            targetStartScrollOffset < _cachedScrollExtent)) {
      final _SliverStaggeredGridLayoutCheckpoint checkpoint =
          _findCheckpointForScrollOffset(targetStartScrollOffset);
      _restoreCheckpoint(checkpoint);
    }

    List<SliverStaggeredGridGeometry> geometries = _cachedGeometries!;
    // 尾部 Geometry 可能已因窗口限制被淘汰；需要继续向后布局时，先恢复
    // 尾部起点的检查点，避免在不连续的索引窗口上追加。
    final int windowEndIndex = _cachedGeometryStartIndex + geometries.length;
    if (windowEndIndex < _cachedItemCount &&
        targetStartScrollOffset > _cachedWindowMaxTrailing) {
      _restoreCheckpoint(_findCheckpointByIndex(windowEndIndex));
    }
    geometries = _cachedGeometries!;
    final List<double> columnOffsets = _cachedColumnOffsets!;
    final double usableCrossAxisExtent =
        constraints.crossAxisExtent -
        crossAxisSpacing * math.max(0, crossAxisCount - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double crossAxisStride = childCrossAxisExtent + crossAxisSpacing;
    // 先扣除列间距，再将剩余空间平均分给每一列。stride 是一列完整占用的
    // 步长，包含列自身尺寸和它右侧的间距。
    final bool reverseCrossAxis = axisDirectionIsReversed(
      constraints.crossAxisDirection,
    );
    // 每个值表示对应列下一个可用的主轴位置。
    double scrollExtent = _cachedScrollExtent;

    // itemCount 增长或目标滚动范围扩大时，从缓存尾部追加新增索引。
    final _SliverStaggeredGridColumnMinHeap columnMinHeap =
        _cachedColumnMinHeap ??= _SliverStaggeredGridColumnMinHeap(
          columnOffsets,
        );
    if (columnMinHeap.columnCount != columnOffsets.length) {
      columnMinHeap.rebuild(columnOffsets);
    }
    int index = _cachedItemCount;
    double windowMaxTrailing = _cachedWindowMaxTrailing;
    bool geometryAdded = false;
    final bool canUpdateGeometryIndexesIncrementally =
        !_geometryIndexesDirty &&
        _cachedBlocks != null &&
        _cachedBlockMaxTrailing != null;
    for (
      ;
      index < itemCount &&
          (windowMaxTrailing <= targetEndScrollOffset ||
              index == _cachedGeometryStartIndex);
      index += 1
    ) {
      if (index % _geometryBlockSize == 0) {
        _recordCheckpoint(
          index,
          columnOffsets,
          _cachedMaxColumnOffset,
          scrollExtent,
        );
      }
      final bool isFullSpan = fullSpanBuilder?.call(index) ?? false;
      final double mainAxisExtent = mainAxisExtentBuilder(index);
      assert(mainAxisExtent >= 0);

      // 普通 item 放入最短列；全宽 item 从最高列之后开始，避免与已有
      // 子节点重叠。
      // 最短列由最小堆直接取得，最高列由增量维护的 max offset 提供。
      final int shortestColumn = columnMinHeap.firstColumn;
      final double minOffset = columnOffsets[shortestColumn];
      final double maxOffset = _cachedMaxColumnOffset;
      final int span = isFullSpan ? crossAxisCount : 1;
      final int rawCrossAxisIndex = isFullSpan ? 0 : shortestColumn;
      final int crossAxisIndex = reverseCrossAxis
          ? crossAxisCount - span - rawCrossAxisIndex
          : rawCrossAxisIndex;
      final double childScrollOffset = isFullSpan ? maxOffset : minOffset;
      // 普通 item 使用最短列的底部作为起点；全宽 item 必须等待所有列中
      // 最高的一列结束，否则会覆盖仍在布局中的其他列。
      final double childCrossAxisOffset = isFullSpan
          ? 0
          : crossAxisIndex * crossAxisStride;
      final double childCrossAxisExtentForIndex = isFullSpan
          ? constraints.crossAxisExtent
          : childCrossAxisExtent;
      final SliverStaggeredGridGeometry flowGeometry =
          SliverStaggeredGridGeometry(
            scrollOffset: childScrollOffset,
            crossAxisOffset: childCrossAxisOffset,
            mainAxisExtent: mainAxisExtent,
            crossAxisExtent: childCrossAxisExtentForIndex,
            crossAxisIndex: crossAxisIndex,
            isFullSpan: isFullSpan,
          );
      geometries.add(flowGeometry);
      geometryAdded = true;
      _cachedGeometryExtentSum += mainAxisExtent;
      _cachedGeometryExtentCount += 1;
      if (canUpdateGeometryIndexesIncrementally) {
        _appendGeometryIndex(flowGeometry, index);
      }

      final double nextOffset =
          flowGeometry.trailingScrollOffset + mainAxisSpacing;
      if (isFullSpan) {
        // 全宽 item 后同步所有列，使后续普通 item 统一从全宽内容下方继续排列。
        for (int column = 0; column < columnOffsets.length; column += 1) {
          columnOffsets[column] = nextOffset;
        }
        _cachedMaxColumnOffset = nextOffset;
        columnMinHeap.rebuild(columnOffsets);
      } else {
        // 普通 item 只推进被选中的最短列。
        columnOffsets[rawCrossAxisIndex] = nextOffset;
        _cachedMaxColumnOffset = math.max(_cachedMaxColumnOffset, nextOffset);
        columnMinHeap.update(rawCrossAxisIndex);
      }
      scrollExtent = math.max(scrollExtent, flowGeometry.trailingScrollOffset);
      windowMaxTrailing = math.max(
        windowMaxTrailing,
        flowGeometry.trailingScrollOffset,
      );
      _cachedItemCount = index + 1;
    }

    _cachedGeometries = geometries;
    // 堆直接引用该列状态列表，后续普通 item 更新时无需重新初始化堆。
    _cachedColumnOffsets = columnOffsets;
    _cachedScrollExtent = scrollExtent;
    _cachedWindowMaxTrailing = windowMaxTrailing;
    if (_cachedItemCount >= itemCount) {
      _cachedKnownTotalScrollExtent = scrollExtent;
    }
    _trimGeometryWindow(targetStartScrollOffset);
    if (_geometryIndexesDirty ||
        (geometryAdded && !canUpdateGeometryIndexesIncrementally)) {
      _rebuildGeometryIndexes();
    }

    final double estimatedScrollExtent =
        _cachedKnownTotalScrollExtent ??
        _estimateScrollExtent(geometries, scrollExtent);
    _cachedCrossAxisExtent = constraints.crossAxisExtent;
    _cachedCrossAxisDirection = constraints.crossAxisDirection;
    _cachedCrossAxisCount = crossAxisCount;

    return _SliverStaggeredGridLayout(
      startIndex: _cachedGeometryStartIndex,
      geometries: _cachedGeometries!,
      computedScrollExtent: scrollExtent,
      scrollExtent: estimatedScrollExtent,
    );
  }

  /// 记录 block 起始位置的列状态，供窗口外跳转时恢复。
  void _recordCheckpoint(
    int index,
    List<double> columnOffsets,
    double maxColumnOffset,
    double scrollExtent,
  ) {
    final _SliverStaggeredGridLayoutCheckpoint checkpoint =
        _SliverStaggeredGridLayoutCheckpoint(
          index: index,
          columnOffsets: List<double>.from(columnOffsets),
          maxColumnOffset: maxColumnOffset,
          scrollExtent: scrollExtent,
        );
    final int existingIndex = _layoutCheckpoints.indexWhere(
      (_SliverStaggeredGridLayoutCheckpoint item) => item.index == index,
    );
    if (existingIndex >= 0) {
      _layoutCheckpoints[existingIndex] = checkpoint;
    } else {
      _layoutCheckpoints.add(checkpoint);
    }
    while (_layoutCheckpoints.length > _maxLayoutCheckpointCount) {
      // 始终保留 index 0，最老区域被淘汰后仍可从头精确重建。
      final int removeIndex = _layoutCheckpoints.first.index == 0 ? 1 : 0;
      _layoutCheckpoints.removeAt(removeIndex);
    }
  }

  /// 按 scroll offset 找到不晚于目标位置的最近检查点。
  _SliverStaggeredGridLayoutCheckpoint _findCheckpointForScrollOffset(
    double scrollOffset,
  ) {
    _SliverStaggeredGridLayoutCheckpoint result = _layoutCheckpoints.first;
    for (final _SliverStaggeredGridLayoutCheckpoint checkpoint
        in _layoutCheckpoints) {
      if (checkpoint.scrollExtent <= scrollOffset &&
          checkpoint.index >= result.index) {
        result = checkpoint;
      }
    }
    return result;
  }

  /// 恢复检查点状态并丢弃当前 Geometry 窗口。
  void _restoreCheckpoint(_SliverStaggeredGridLayoutCheckpoint checkpoint) {
    final List<double> offsets = checkpoint.columnOffsets.isEmpty
        ? List<double>.filled(crossAxisCount, 0)
        : List<double>.from(checkpoint.columnOffsets);
    if (checkpoint.index == 0 &&
        !_layoutCheckpoints.any(
          (_SliverStaggeredGridLayoutCheckpoint item) => item.index == 0,
        )) {
      _layoutCheckpoints.add(
        _SliverStaggeredGridLayoutCheckpoint(
          index: 0,
          columnOffsets: List<double>.from(offsets),
          maxColumnOffset: 0,
          scrollExtent: 0,
        ),
      );
    }
    _cachedGeometries = <SliverStaggeredGridGeometry>[];
    _cachedGeometryStartIndex = checkpoint.index;
    _cachedWindowStartScrollExtent = checkpoint.scrollExtent;
    _cachedWindowMaxTrailing = checkpoint.scrollExtent;
    _cachedColumnOffsets = offsets;
    _cachedColumnMinHeap = _SliverStaggeredGridColumnMinHeap(offsets);
    _cachedMaxColumnOffset = checkpoint.maxColumnOffset;
    _cachedItemCount = checkpoint.index;
    _cachedScrollExtent = checkpoint.scrollExtent;
    _cachedGeometryExtentSum = 0;
    _cachedGeometryExtentCount = 0;
    _cachedEstimatedScrollExtent = null;
    _cachedEstimatedItemCount = -1;
    _geometryIndexesDirty = true;
  }

  /// 限制 Geometry 窗口大小，并保留窗口起点对应的检查点。
  void _trimGeometryWindow(double targetStartScrollOffset) {
    final List<SliverStaggeredGridGeometry> geometries = _cachedGeometries!;
    while (geometries.length > _maxGeometryWindowSize) {
      final int removeCount = _geometryBlockSize;
      final int leadingEnd = math.min(removeCount, geometries.length);
      final List<_SliverStaggeredGridGeometryBlock>? blocks = _cachedBlocks;
      final bool canUseLeadingBlock =
          !_geometryIndexesDirty &&
          blocks != null &&
          blocks.isNotEmpty &&
          blocks.first.startIndex == _cachedGeometryStartIndex &&
          blocks.first.endIndex >= _cachedGeometryStartIndex + leadingEnd;
      final double leadingMaxTrailing;
      if (canUseLeadingBlock) {
        // block 元数据已覆盖待裁剪区域，直接复用最大 trailing offset。
        leadingMaxTrailing = blocks.first.maxTrailingScrollOffset;
      } else {
        // checkpoint 恢复或索引失效期间，保留精确扫描作为安全兜底。
        double maxTrailing = double.negativeInfinity;
        for (int index = 0; index < leadingEnd; index += 1) {
          maxTrailing = math.max(
            maxTrailing,
            geometries[index].trailingScrollOffset,
          );
        }
        leadingMaxTrailing = maxTrailing;
      }
      final bool canTrimLeading =
          targetStartScrollOffset > _cachedWindowStartScrollExtent &&
          leadingMaxTrailing < targetStartScrollOffset;
      if (!canTrimLeading) {
        // 目标仍位于窗口起点附近时保留 leading 区域，淘汰尾部 Geometry。
        final int start = geometries.length - removeCount;
        for (int index = start; index < geometries.length; index += 1) {
          _cachedGeometryExtentSum -= geometries[index].mainAxisExtent;
          _cachedGeometryExtentCount -= 1;
        }
        geometries.removeRange(start, geometries.length);
      } else {
        // 目标位于窗口后方时淘汰 leading 区域，并保留目标附近索引。
        final int newStartIndex = _cachedGeometryStartIndex + removeCount;
        final _SliverStaggeredGridLayoutCheckpoint checkpoint =
            _findCheckpointByIndex(newStartIndex);
        for (int index = 0; index < removeCount; index += 1) {
          _cachedGeometryExtentSum -= geometries[index].mainAxisExtent;
          _cachedGeometryExtentCount -= 1;
        }
        geometries.removeRange(0, removeCount);
        _cachedGeometryStartIndex = newStartIndex;
        _cachedWindowStartScrollExtent = checkpoint.scrollExtent;
      }
      _geometryIndexesDirty = true;
    }
  }

  /// 按 block 起始索引查找检查点，供淘汰 Geometry 时保存窗口边界状态。
  _SliverStaggeredGridLayoutCheckpoint _findCheckpointByIndex(int index) {
    for (final _SliverStaggeredGridLayoutCheckpoint checkpoint
        in _layoutCheckpoints) {
      if (checkpoint.index == index) {
        return checkpoint;
      }
    }
    return _layoutCheckpoints.first;
  }

  /// 重建当前窗口的 block 范围索引和累计最大 trailing 索引。
  /// 当 Geometry 仅在窗口尾部追加时，优先使用 [_appendGeometryIndex]，
  /// 将更新成本限制在新增 block，而不是重新扫描整个窗口。
  void _rebuildGeometryIndexes() {
    final List<SliverStaggeredGridGeometry> geometries = _cachedGeometries!;
    final List<double> blockMax = <double>[];
    final List<_SliverStaggeredGridGeometryBlock> blocks =
        <_SliverStaggeredGridGeometryBlock>[];
    double cumulativeMax = _cachedWindowStartScrollExtent;
    double windowMaxTrailing = _cachedWindowStartScrollExtent;
    for (
      int offset = 0;
      offset < geometries.length;
      offset += _geometryBlockSize
    ) {
      final int end = math.min(offset + _geometryBlockSize, geometries.length);
      double minScroll = double.infinity;
      double maxTrailing = double.negativeInfinity;
      for (int index = offset; index < end; index += 1) {
        final SliverStaggeredGridGeometry geometry = geometries[index];
        minScroll = math.min(minScroll, geometry.scrollOffset);
        maxTrailing = math.max(maxTrailing, geometry.trailingScrollOffset);
        windowMaxTrailing = math.max(
          windowMaxTrailing,
          geometry.trailingScrollOffset,
        );
        cumulativeMax = math.max(cumulativeMax, geometry.trailingScrollOffset);
      }
      blockMax.add(cumulativeMax);
      blocks.add(
        _SliverStaggeredGridGeometryBlock(
          startIndex: _cachedGeometryStartIndex + offset,
          endIndex: _cachedGeometryStartIndex + end,
          minScrollOffset: minScroll,
          maxTrailingScrollOffset: maxTrailing,
        ),
      );
    }
    _cachedBlockMaxTrailing = blockMax;
    _cachedBlocks = blocks;
    _cachedWindowMaxTrailing = windowMaxTrailing;
    _geometryIndexesDirty = false;
  }

  /// 增量更新尾部追加 Geometry 对应的 block 索引。
  void _appendGeometryIndex(
    SliverStaggeredGridGeometry geometry,
    int absoluteIndex,
  ) {
    final List<_SliverStaggeredGridGeometryBlock>? blocks = _cachedBlocks;
    final List<double>? blockMax = _cachedBlockMaxTrailing;
    if (blocks == null || blockMax == null || blocks.isEmpty) {
      _geometryIndexesDirty = true;
      return;
    }
    final int blockIndex =
        (absoluteIndex - _cachedGeometryStartIndex) ~/ _geometryBlockSize;
    if (blockIndex == blocks.length) {
      final double previousMax = blockMax.isEmpty
          ? _cachedWindowStartScrollExtent
          : blockMax.last;
      blocks.add(
        _SliverStaggeredGridGeometryBlock(
          startIndex: absoluteIndex,
          endIndex: absoluteIndex + 1,
          minScrollOffset: geometry.scrollOffset,
          maxTrailingScrollOffset: geometry.trailingScrollOffset,
        ),
      );
      blockMax.add(math.max(previousMax, geometry.trailingScrollOffset));
    } else if (blockIndex < blocks.length) {
      final _SliverStaggeredGridGeometryBlock oldBlock = blocks[blockIndex];
      blocks[blockIndex] = _SliverStaggeredGridGeometryBlock(
        startIndex: oldBlock.startIndex,
        endIndex: absoluteIndex + 1,
        minScrollOffset: math.min(
          oldBlock.minScrollOffset,
          geometry.scrollOffset,
        ),
        maxTrailingScrollOffset: math.max(
          oldBlock.maxTrailingScrollOffset,
          geometry.trailingScrollOffset,
        ),
      );
      double cumulativeMax = blockIndex == 0
          ? _cachedWindowStartScrollExtent
          : blockMax[blockIndex - 1];
      for (int index = blockIndex; index < blocks.length; index += 1) {
        cumulativeMax = math.max(
          cumulativeMax,
          blocks[index].maxTrailingScrollOffset,
        );
        blockMax[index] = cumulativeMax;
      }
    } else {
      _geometryIndexesDirty = true;
      return;
    }
  }

  /// 参考 RenderSliverGrid，根据当前窗口的平均 item 尺寸估算总滚动范围。
  double _estimateScrollExtent(
    List<SliverStaggeredGridGeometry> geometries,
    double scrollExtent,
  ) {
    if (geometries.isEmpty || _cachedKnownTotalScrollExtent != null) {
      return scrollExtent;
    }
    if (_cachedEstimatedScrollExtent != null &&
        _cachedEstimatedItemCount == _cachedItemCount) {
      return math.max(scrollExtent, _cachedEstimatedScrollExtent!);
    }
    final double averageExtent = _cachedGeometryExtentCount == 0
        ? 0
        : _cachedGeometryExtentSum / _cachedGeometryExtentCount;
    final int remainingCount = itemCount - _cachedItemCount;
    final double estimatedRemaining =
        (remainingCount / math.max(1, crossAxisCount)) *
        (averageExtent + mainAxisSpacing);
    final double estimate = math.max(
      scrollExtent,
      _cachedMaxColumnOffset + estimatedRemaining,
    );
    _cachedEstimatedScrollExtent = estimate;
    _cachedEstimatedItemCount = _cachedItemCount;
    return estimate;
  }

  int? _getFirstIndexForScrollOffset(
    List<SliverStaggeredGridGeometry> geometries,
    double scrollOffset,
  ) {
    // 不同瀑布流列的偏移并非全局单调：后加入的 item 可能位于另一列更高
    // 或更低的位置。因此这里逐个检查 trailingScrollOffset，找到第一个
    // 仍可能与 scrollOffset 相交的索引，而不能直接使用二分查找。
    final List<double>? blockMax = _cachedBlockMaxTrailing;
    if (blockMax != null && blockMax.isNotEmpty) {
      int low = 0;
      int high = blockMax.length - 1;
      while (low < high) {
        final int middle = (low + high) ~/ 2;
        if (blockMax[middle] >= scrollOffset) {
          high = middle;
        } else {
          low = middle + 1;
        }
      }
      final _SliverStaggeredGridGeometryBlock block = _cachedBlocks![low];
      for (int index = block.startIndex; index < block.endIndex; index += 1) {
        if (geometries[index - _cachedGeometryStartIndex]
                .trailingScrollOffset >=
            scrollOffset) {
          return index;
        }
      }
      return null;
    }
    for (int index = 0; index < geometries.length; index += 1) {
      if (geometries[index].trailingScrollOffset >= scrollOffset) {
        return _cachedGeometryStartIndex + index;
      }
    }
    return null;
  }

  int _getLastIndexForScrollOffset(
    List<SliverStaggeredGridGeometry> geometries,
    double targetEndScrollOffset,
    int firstIndex,
  ) {
    // 从首项向后扫描。只要 item 的起始位置尚未超过目标结束位置，它就可能
    // 出现在视口或缓存区内；额外保留第一个越界索引后再停止，能够覆盖不同
    // 列之间交错排列的情况。
    int lastInRange = firstIndex;
    int? firstBeyond;
    final List<_SliverStaggeredGridGeometryBlock>? blocks = _cachedBlocks;
    if (blocks == null || blocks.isEmpty) {
      int result = firstIndex;
      for (
        int index = firstIndex;
        index < _cachedGeometryStartIndex + geometries.length;
        index += 1
      ) {
        result = index;
        if (geometries[index - _cachedGeometryStartIndex].scrollOffset >
            targetEndScrollOffset) {
          break;
        }
      }
      return result;
    }

    final int firstBlock = math.max(
      0,
      (firstIndex - _cachedGeometryStartIndex) ~/ _geometryBlockSize,
    );
    // 当前窗口最多包含 8 个 block，反向扫描比维护分段树更简单且成本有界。
    int candidateBlock = -1;
    for (int index = blocks.length - 1; index >= firstBlock; index -= 1) {
      if (blocks[index].minScrollOffset <= targetEndScrollOffset) {
        candidateBlock = index;
        break;
      }
    }
    if (candidateBlock >= 0) {
      final _SliverStaggeredGridGeometryBlock block = blocks[candidateBlock];
      final int start = math.max(firstIndex, block.startIndex);
      for (int index = start; index < block.endIndex; index += 1) {
        final SliverStaggeredGridGeometry geometry =
            geometries[index - _cachedGeometryStartIndex];
        if (geometry.scrollOffset <= targetEndScrollOffset) {
          lastInRange = index;
        } else {
          firstBeyond ??= index;
        }
      }
    }
    return math.max(lastInRange, firstBeyond ?? lastInRange);
  }

  void _layoutChild(RenderBox child, SliverStaggeredGridGeometry flowGeometry) {
    // 先应用计算出的固定约束，再写入父数据。
    child.layout(flowGeometry.getBoxConstraints(constraints));
    _applyParentData(child, flowGeometry);
  }

  void _applyParentData(
    RenderBox child,
    SliverStaggeredGridGeometry flowGeometry,
  ) {
    // 父数据由 Sliver 协议读取布局偏移，并由 childCrossAxisPosition
    // 读取交叉轴绘制位置。
    final SliverStaggeredGridParentData childParentData =
        child.parentData! as SliverStaggeredGridParentData;
    childParentData.layoutOffset = flowGeometry.scrollOffset;
    childParentData.crossAxisOffset = flowGeometry.crossAxisOffset;
    // 保留已废弃字段的写入，以兼容外部调试和扩展代码。
    // ignore: deprecated_member_use_from_same_package
    childParentData.crossAxisIndex = flowGeometry.crossAxisIndex;
    // ignore: deprecated_member_use_from_same_package
    childParentData.isFullSpan = flowGeometry.isFullSpan;
  }
}
