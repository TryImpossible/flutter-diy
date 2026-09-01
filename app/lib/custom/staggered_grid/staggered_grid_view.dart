import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

part 'staggered_grid_layout.dart';
part 'render_sliver_staggered_grid.dart';

/// 按索引判断 item 是否横跨全部列。
///
/// 回调对象的身份参与 delegate 的重布局判断：布局结果变化时应创建新的
/// 闭包，布局结果不变时应复用原闭包，避免不必要的几何缓存失效。
/// 回调会在 RenderObject 布局阶段同步执行，应保持 O(1)、纯函数且无 IO 或
/// 其他副作用；尺寸或全宽数据应由调用者预先准备。
typedef IndexedFullSpanBuilder = bool Function(int index);

/// 返回 item 沿滚动轴的固定尺寸，必须与实际子节点尺寸一致。
///
/// 回调对象的身份参与 delegate 的重布局判断：当闭包捕获的数据导致尺寸变化
/// 时必须创建新的闭包；数据未变化时应复用原闭包。
/// 回调会在 RenderObject 布局阶段同步执行，应保持 O(1)、纯函数且无 IO 或
/// 其他副作用；尺寸数据应由调用者预先准备。
typedef IndexedMainAxisExtentBuilder = double Function(int index);

/// 描述 [SliverStaggeredGrid] 布局规则的委托基类。
abstract class SliverStaggeredGridDelegate {
  const SliverStaggeredGridDelegate();

  int get crossAxisCount;
  double get mainAxisSpacing;
  double get crossAxisSpacing;
  IndexedFullSpanBuilder? get fullSpanBuilder;
  IndexedMainAxisExtentBuilder get mainAxisExtentBuilder;
  int getCrossAxisCount(SliverConstraints constraints) => crossAxisCount;

  /// 比较新旧配置，决定是否清空 RenderObject 的几何缓存。
  bool shouldRelayout(covariant SliverStaggeredGridDelegate oldDelegate);
}

/// 固定列数的瀑布流布局配置。
class SliverStaggeredGridDelegateWithFixedCrossAxisCount
    extends SliverStaggeredGridDelegate {
  const SliverStaggeredGridDelegateWithFixedCrossAxisCount({
    required this.crossAxisCount,
    required this.mainAxisExtentBuilder,
    this.fullSpanBuilder,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
  }) : assert(crossAxisCount > 0),
       assert(mainAxisSpacing >= 0),
       assert(crossAxisSpacing >= 0);

  @override
  final int crossAxisCount;
  @override
  final double mainAxisSpacing;
  @override
  final double crossAxisSpacing;
  @override
  final IndexedFullSpanBuilder? fullSpanBuilder;
  @override
  final IndexedMainAxisExtentBuilder mainAxisExtentBuilder;

  @override
  bool shouldRelayout(covariant SliverStaggeredGridDelegate oldDelegate) {
    if (oldDelegate is! SliverStaggeredGridDelegateWithFixedCrossAxisCount) {
      return true;
    }
    return crossAxisCount != oldDelegate.crossAxisCount ||
        mainAxisSpacing != oldDelegate.mainAxisSpacing ||
        crossAxisSpacing != oldDelegate.crossAxisSpacing ||
        fullSpanBuilder != oldDelegate.fullSpanBuilder ||
        mainAxisExtentBuilder != oldDelegate.mainAxisExtentBuilder;
  }
}

/// 根据最大列宽动态计算列数的瀑布流布局委托。
class SliverStaggeredGridDelegateWithMaxCrossAxisExtent
    extends SliverStaggeredGridDelegateWithFixedCrossAxisCount {
  const SliverStaggeredGridDelegateWithMaxCrossAxisExtent({
    required this.maxCrossAxisExtent,
    required super.mainAxisExtentBuilder,
    super.fullSpanBuilder,
    super.mainAxisSpacing,
    super.crossAxisSpacing,
  }) : assert(maxCrossAxisExtent > 0),
       super(crossAxisCount: 1);

  final double maxCrossAxisExtent;

  @override
  int getCrossAxisCount(SliverConstraints constraints) => math.max(
    1,
    (constraints.crossAxisExtent / (maxCrossAxisExtent + crossAxisSpacing))
        .ceil(),
  );

  @override
  bool shouldRelayout(covariant SliverStaggeredGridDelegate oldDelegate) =>
      oldDelegate is! SliverStaggeredGridDelegateWithMaxCrossAxisExtent ||
      maxCrossAxisExtent != oldDelegate.maxCrossAxisExtent ||
      super.shouldRelayout(oldDelegate);
}

/// 支持瀑布流布局，并允许部分 item 横跨全部列的 Sliver 组件。
///
/// 组件将子节点创建交给 Flutter 的 Sliver 子节点管理器，同时根据 item
/// 的索引和尺寸计算每个子节点在瀑布流中的位置。请在
/// [CustomScrollView.slivers] 列表中使用。
class SliverStaggeredGrid extends SliverMultiBoxAdaptorWidget {
  /// 创建一个使用外部 [SliverChildDelegate] 提供子节点的瀑布流 Sliver。
  ///
  /// 布局器不会根据子节点实际大小测量主轴尺寸，而是通过
  /// [mainAxisExtentBuilder] 预先获得每个索引的固定尺寸。因此，回调返回值
  /// 应与子节点最终尺寸保持一致，否则子节点之间可能出现空白或重叠。
  const SliverStaggeredGrid({
    super.key,
    required super.delegate,
    required this.gridDelegate,
  }) : itemCount = null;

  /// 使用 Builder 按需创建子节点。Flutter 只会请求当前视口及缓存范围内
  /// 的索引，适合长列表；但布局位置仍需要依据每个索引的尺寸进行计算。
  /// [gridDelegate] 中的布局回调在 UI 线程同步执行，应保持 O(1) 且无 IO、
  /// 网络请求或其他副作用。
  SliverStaggeredGrid.builder({
    super.key,
    required this.gridDelegate,
    required NullableIndexedWidgetBuilder itemBuilder,
    required this.itemCount,
    ChildIndexGetter? findChildIndexCallback,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) : assert(itemCount == null || itemCount >= 0),
       super(
         delegate: SliverChildBuilderDelegate(
           itemBuilder,
           findChildIndexCallback: findChildIndexCallback,
           childCount: itemCount,
           addAutomaticKeepAlives: addAutomaticKeepAlives,
           addRepaintBoundaries: addRepaintBoundaries,
           addSemanticIndexes: addSemanticIndexes,
         ),
       );

  /// 使用固定列数和非懒加载子节点列表创建瀑布流 Sliver。
  /// 大数据量场景请改用 [SliverStaggeredGrid.builder]，避免一次性持有所有 Widget。
  /// [addAutomaticKeepAlives]、[addRepaintBoundaries] 和
  /// [addSemanticIndexes] 的默认值与 Flutter 的 Sliver 委托一致；可根据
  /// 子节点状态、绘制复杂度和无障碍需求进行调整。
  SliverStaggeredGrid.count({
    super.key,
    required int crossAxisCount,
    required IndexedMainAxisExtentBuilder mainAxisExtentBuilder,
    IndexedFullSpanBuilder? fullSpanBuilder,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    List<Widget> children = const <Widget>[],
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) : itemCount = children.length,
       gridDelegate = SliverStaggeredGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: crossAxisCount,
         mainAxisExtentBuilder: mainAxisExtentBuilder,
         fullSpanBuilder: fullSpanBuilder,
         mainAxisSpacing: mainAxisSpacing,
         crossAxisSpacing: crossAxisSpacing,
       ),
       super(
         delegate: SliverChildListDelegate(
           children,
           addAutomaticKeepAlives: addAutomaticKeepAlives,
           addRepaintBoundaries: addRepaintBoundaries,
           addSemanticIndexes: addSemanticIndexes,
         ),
       );

  /// 使用最大列宽和非懒加载子节点列表创建瀑布流 Sliver。
  /// 大数据量场景请改用 [SliverStaggeredGrid.builder]，避免一次性持有所有 Widget。
  /// [addAutomaticKeepAlives]、[addRepaintBoundaries] 和
  /// [addSemanticIndexes] 的默认值与 Flutter 的 Sliver 委托一致；可根据
  /// 子节点状态、绘制复杂度和无障碍需求进行调整。
  SliverStaggeredGrid.extent({
    super.key,
    required double maxCrossAxisExtent,
    required IndexedMainAxisExtentBuilder mainAxisExtentBuilder,
    IndexedFullSpanBuilder? fullSpanBuilder,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    List<Widget> children = const <Widget>[],
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) : itemCount = children.length,
       gridDelegate = SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
         maxCrossAxisExtent: maxCrossAxisExtent,
         mainAxisExtentBuilder: mainAxisExtentBuilder,
         fullSpanBuilder: fullSpanBuilder,
         mainAxisSpacing: mainAxisSpacing,
         crossAxisSpacing: crossAxisSpacing,
       ),
       super(
         delegate: SliverChildListDelegate(
           children,
           addAutomaticKeepAlives: addAutomaticKeepAlives,
           addRepaintBoundaries: addRepaintBoundaries,
           addSemanticIndexes: addSemanticIndexes,
         ),
       );

  /// 交叉轴上的列数。
  /// Sliver 可用的子节点数量。
  final int? itemCount;

  /// 每个 item 在主轴方向后方占用的间距。
  /// 相邻列之间的间距。
  /// 可选回调，用于将指定子节点标记为全宽 item。
  /// 当 Builder 捕获的数据变化时，应创建新的布局闭包，以主动使布局缓存失效。

  /// 提供每个子节点沿滚动轴方向的固定尺寸。
  /// 控制列数、间距、尺寸和全宽规则的布局委托。
  final SliverStaggeredGridDelegate gridDelegate;

  @override
  SliverMultiBoxAdaptorElement createElement() {
    // 使用 SliverMultiBoxAdaptorElement，使子节点能够按照索引被创建、移动
    // 和回收，并复用 Flutter 对 keep-alive、语义节点和重建的标准处理。
    return SliverMultiBoxAdaptorElement(this);
  }

  @override
  RenderSliverStaggeredGrid createRenderObject(BuildContext context) {
    // Element 同时也是子节点管理器。RenderObject 只负责几何计算和布局，
    // 不直接持有 Widget；当需要某个索引时，通过 childManager 请求对应子节点。
    final SliverMultiBoxAdaptorElement element =
        context as SliverMultiBoxAdaptorElement;
    assert(
      itemCountForRenderObject != null,
      'SliverStaggeredGrid 需要 SliverChildDelegate.estimatedChildCount，'
      '请使用 builder 构造函数并提供 itemCount。',
    );
    return RenderSliverStaggeredGrid(
      childManager: element,
      delegate: gridDelegate,
      itemCount: itemCountForRenderObject ?? 0,
    );
  }

  int? get itemCountForRenderObject =>
      itemCount ?? delegate.estimatedChildCount;

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSliverStaggeredGrid renderObject,
  ) {
    // 根据不可变的 Widget 配置更新 RenderObject 属性；布局参数变化后，
    // 标记 Sliver 需要重新布局。
    renderObject
      ..delegate = gridDelegate
      ..itemCount = itemCountForRenderObject ?? 0;
  }
}

/// 可独立滚动的瀑布流视图，内部通过单个 [SliverStaggeredGrid] 实现布局。
///
/// 视图继承 [BoxScrollView.cacheExtent] 语义；缓存范围越大，预创建的子节点
/// 越多，布局、绘制和内存成本越高，应结合实际滚动性能进行调节。
class StaggeredGridView extends BoxScrollView {
  /// 使用自定义子节点委托创建瀑布流视图。
  const StaggeredGridView.custom({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required this.gridDelegate,
    required this.childrenDelegate,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.clipBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.hitTestBehavior,
  });

  /// 使用 builder 按需创建子节点的瀑布流视图。
  /// [gridDelegate] 中的布局回调在 UI 线程同步执行，应保持 O(1) 且无 IO、
  /// 网络请求或其他副作用。
  StaggeredGridView.builder({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required this.gridDelegate,
    required NullableIndexedWidgetBuilder itemBuilder,
    int? itemCount,
    ChildIndexGetter? findChildIndexCallback,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  }) : childrenDelegate = SliverChildBuilderDelegate(
         itemBuilder,
         findChildIndexCallback: findChildIndexCallback,
         childCount: itemCount,
         addAutomaticKeepAlives: addAutomaticKeepAlives,
         addRepaintBoundaries: addRepaintBoundaries,
         addSemanticIndexes: addSemanticIndexes,
       );

  /// 使用固定列数和非懒加载子节点创建瀑布流视图。
  /// 大数据量场景请改用 [StaggeredGridView.builder]，避免一次性持有所有 Widget。
  /// [cacheExtent] 越大，预创建的子节点越多，布局、绘制和内存成本越高。
  /// 三个子节点策略开关默认与 Flutter 的 Sliver 委托一致，可按需调整。
  StaggeredGridView.count({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required int crossAxisCount,
    required IndexedMainAxisExtentBuilder mainAxisExtentBuilder,
    IndexedFullSpanBuilder? fullSpanBuilder,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    List<Widget> children = const <Widget>[],
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  }) : gridDelegate = SliverStaggeredGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: crossAxisCount,
         mainAxisExtentBuilder: mainAxisExtentBuilder,
         fullSpanBuilder: fullSpanBuilder,
         mainAxisSpacing: mainAxisSpacing,
         crossAxisSpacing: crossAxisSpacing,
       ),
       childrenDelegate = SliverChildListDelegate(
         children,
         addAutomaticKeepAlives: addAutomaticKeepAlives,
         addRepaintBoundaries: addRepaintBoundaries,
         addSemanticIndexes: addSemanticIndexes,
       );

  /// 使用最大列宽和非懒加载子节点创建瀑布流视图。
  /// 大数据量场景请改用 [StaggeredGridView.builder]，避免一次性持有所有 Widget。
  /// [cacheExtent] 越大，预创建的子节点越多，布局、绘制和内存成本越高。
  /// 三个子节点策略开关默认与 Flutter 的 Sliver 委托一致，可按需调整。
  StaggeredGridView.extent({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required double maxCrossAxisExtent,
    required IndexedMainAxisExtentBuilder mainAxisExtentBuilder,
    IndexedFullSpanBuilder? fullSpanBuilder,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    List<Widget> children = const <Widget>[],
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    super.hitTestBehavior,
  }) : gridDelegate = SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
         maxCrossAxisExtent: maxCrossAxisExtent,
         mainAxisExtentBuilder: mainAxisExtentBuilder,
         fullSpanBuilder: fullSpanBuilder,
         mainAxisSpacing: mainAxisSpacing,
         crossAxisSpacing: crossAxisSpacing,
       ),
       childrenDelegate = SliverChildListDelegate(
         children,
         addAutomaticKeepAlives: addAutomaticKeepAlives,
         addRepaintBoundaries: addRepaintBoundaries,
         addSemanticIndexes: addSemanticIndexes,
       );

  final SliverStaggeredGridDelegate gridDelegate;
  final SliverChildDelegate childrenDelegate;

  @override
  Widget buildChildLayout(BuildContext context) => SliverStaggeredGrid(
    delegate: childrenDelegate,
    gridDelegate: gridDelegate,
  );
}
