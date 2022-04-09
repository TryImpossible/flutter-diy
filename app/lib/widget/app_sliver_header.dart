import 'package:flutter/material.dart';

class AppSliverHeader extends StatelessWidget {
  const AppSliverHeader({
    Key? key,
    this.pinned = false,
    this.floating = false,
    required this.expandedHeight,
    this.collapsedHeight = 0,
    required this.builder,
  }) : super(key: key);
  final bool pinned;
  final bool floating;
  final double collapsedHeight;
  final double expandedHeight;
  final AppSliverHeaderBuilder builder;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: AppSliverHeaderDelegate.builder(
        maxHeight: expandedHeight,
        minHeight: collapsedHeight,
        builder: builder,
      ),
    );
  }
}

typedef AppSliverHeaderBuilder = Widget Function(
  BuildContext context,
  double shrinkOffset,
  bool overlapsContent,
);

class AppSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  AppSliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((
          BuildContext context,
          double shrinkOffset,
          bool overlapsContent,
        ) {
          return child;
        }),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  AppSliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((
          BuildContext context,
          double shrinkOffset,
          bool overlapsContent,
        ) {
          return child;
        }),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  AppSliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final AppSliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        debugPrint(
            '${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(AppSliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}
