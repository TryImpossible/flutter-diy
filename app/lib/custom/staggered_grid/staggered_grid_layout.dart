part of 'staggered_grid_view.dart';

/// 当前约束下的瀑布流布局查询对象，不负责创建或回收 Widget。
@Deprecated(
  'SliverStaggeredGridLayout is no longer used by the render object '
  'and will be removed in a future major version.',
)
abstract class SliverStaggeredGridLayout {
  const SliverStaggeredGridLayout();

  /// 返回与滚动位置相交的首个候选索引。
  int getMinChildIndexForScrollOffset(double scrollOffset);
  int getMaxChildIndexForScrollOffset(double scrollOffset);
  SliverStaggeredGridGeometry getGeometryForChildIndex(int index);

  /// 根据逻辑子节点总数计算完整滚动范围。
  double computeMaxScrollOffset(int childCount);
}

class SliverStaggeredGridParentData extends SliverMultiBoxAdaptorParentData {
  /// 子节点在交叉轴方向的偏移，具体方向取决于滚动轴方向。
  double? crossAxisOffset;

  /// 非全宽子节点使用的列索引。
  @Deprecated(
    'crossAxisIndex is not used by the current layout or paint pipeline '
    'and may be removed in a future major version.',
  )
  int? crossAxisIndex;

  /// 当前子节点是否横跨整个交叉轴。
  @Deprecated(
    'isFullSpan is not used by the current layout or paint pipeline '
    'and may be removed in a future major version.',
  )
  bool isFullSpan = false;
}

/// 描述单个子节点布局位置的不可变数据。
class SliverStaggeredGridGeometry {
  const SliverStaggeredGridGeometry({
    required this.scrollOffset,
    required this.crossAxisOffset,
    required this.mainAxisExtent,
    required this.crossAxisExtent,
    required this.crossAxisIndex,
    required this.isFullSpan,
  });

  /// 子节点在滚动轴方向的起始位置。
  final double scrollOffset;

  /// 子节点在交叉轴方向的起始位置。
  final double crossAxisOffset;

  /// 子节点沿滚动轴方向的固定尺寸。
  final double mainAxisExtent;

  /// 子节点在交叉轴方向分配到的宽度或高度。
  final double crossAxisExtent;

  /// 瀑布流算法为子节点选择的逻辑列。
  final int crossAxisIndex;

  /// 当前布局信息是否占据全部列。
  final bool isFullSpan;

  /// 用于判断是否与视口相交的结束位置。
  double get trailingScrollOffset => scrollOffset + mainAxisExtent;

  BoxConstraints getBoxConstraints(SliverConstraints constraints) {
    // 固定最小和最大尺寸，避免子节点改变父 Sliver 计算出的布局位置。
    return constraints.asBoxConstraints(
      minExtent: mainAxisExtent,
      maxExtent: mainAxisExtent,
      crossAxisExtent: crossAxisExtent,
    );
  }
}

class _SliverStaggeredGridLayout {
  const _SliverStaggeredGridLayout({
    required this.startIndex,
    required this.geometries,
    required this.computedScrollExtent,
    required this.scrollExtent,
  });

  /// 当前 Geometry 窗口的起始索引。
  final int startIndex;

  /// 从 [startIndex] 开始连续排列的布局信息；只有可见范围内的 Widget
  /// 才会被创建，窗口之外的 Geometry 通过检查点按需重建。
  final List<SliverStaggeredGridGeometry> geometries;

  /// 所有已计算子节点中最远的结束边界。
  final double computedScrollExtent;

  /// 对外报告的滚动范围，未计算到列表末尾时可能是估算值。
  final double scrollExtent;

  /// 按绝对索引读取当前窗口中的 Geometry。
  SliverStaggeredGridGeometry getGeometryForIndex(int index) =>
      geometries[index - startIndex];
}

/// Geometry 缓存块的范围索引。瀑布流 offset 非单调，因此同时保存块内
/// 起始位置和结束位置的保守边界，先筛选候选块，再进行块内精确扫描。
class _SliverStaggeredGridGeometryBlock {
  const _SliverStaggeredGridGeometryBlock({
    required this.startIndex,
    required this.endIndex,
    required this.minScrollOffset,
    required this.maxTrailingScrollOffset,
  });

  final int startIndex;
  final int endIndex;
  final double minScrollOffset;
  final double maxTrailingScrollOffset;
}

/// 保存一个 Geometry block 开始位置的列状态，用于窗口淘汰后恢复布局。
class _SliverStaggeredGridLayoutCheckpoint {
  const _SliverStaggeredGridLayoutCheckpoint({
    required this.index,
    required this.columnOffsets,
    required this.maxColumnOffset,
    required this.scrollExtent,
  });

  final int index;
  final List<double> columnOffsets;
  final double maxColumnOffset;
  final double scrollExtent;
}

/// 维护列 offset 的最小堆，普通 item 更新列时避免扫描全部列。
class _SliverStaggeredGridColumnMinHeap {
  _SliverStaggeredGridColumnMinHeap(List<double> offsets) {
    rebuild(offsets);
  }

  /// 按列 offset 排序的列索引堆。
  final List<int> _heap = <int>[];

  /// 堆排序使用的列 offset 引用。
  late List<double> _offsets;

  /// 每个列索引在堆中的位置，用于 O(log C) 更新。
  late List<int> _positions;

  /// 当前堆覆盖的列数，用于校验缓存列状态是否仍可复用。
  int get columnCount => _heap.length;

  int get firstColumn => _heap.first;

  /// 使用最新列 offset 重建最小堆，主要用于全宽 item 后的同步更新。
  void rebuild(List<double> offsets) {
    _offsets = offsets;
    _heap
      ..clear()
      ..addAll(List<int>.generate(offsets.length, (int index) => index));
    _positions = List<int>.filled(offsets.length, 0);
    for (int index = (_heap.length ~/ 2) - 1; index >= 0; index -= 1) {
      _siftDown(index);
    }
    for (int index = 0; index < _heap.length; index += 1) {
      _positions[_heap[index]] = index;
    }
  }

  /// 更新单列 offset 后恢复堆序，复杂度为 O(log C)。
  void update(int column) {
    final int position = _positions[column];
    _siftUp(position);
    _siftDown(_positions[column]);
  }

  /// 按 offset 和列索引比较两个堆节点，确保布局顺序稳定。
  bool _isLess(int left, int right) {
    final double leftOffset = _offsets[left];
    final double rightOffset = _offsets[right];
    return leftOffset < rightOffset ||
        (leftOffset == rightOffset && left < right);
  }

  /// 交换堆节点并同步索引位置表。
  void _swap(int left, int right) {
    final int column = _heap[left];
    _heap[left] = _heap[right];
    _heap[right] = column;
    _positions[_heap[left]] = left;
    _positions[_heap[right]] = right;
  }

  /// 向上调整指定堆节点。
  void _siftUp(int index) {
    while (index > 0) {
      final int parent = (index - 1) ~/ 2;
      if (!_isLess(_heap[index], _heap[parent])) {
        break;
      }
      _swap(index, parent);
      index = parent;
    }
  }

  /// 向下调整指定堆节点。
  void _siftDown(int index) {
    while (true) {
      final int left = index * 2 + 1;
      if (left >= _heap.length) {
        return;
      }
      final int right = left + 1;
      int smallest = left;
      if (right < _heap.length && _isLess(_heap[right], _heap[left])) {
        smallest = right;
      }
      if (!_isLess(_heap[smallest], _heap[index])) {
        return;
      }
      _swap(index, smallest);
      index = smallest;
    }
  }
}
