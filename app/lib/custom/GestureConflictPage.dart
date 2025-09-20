import 'package:flutter/material.dart';

class GestureConflictPage extends StatefulWidget {
  const GestureConflictPage({super.key});

  @override
  State<GestureConflictPage> createState() => _GestureConflictPageState();
}

class _GestureConflictPageState extends State<GestureConflictPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('手势冲突')),
      body: ListView.builder(
        controller: _controller,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 3) {
            return SizedBox(
              height: 300,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: _ChildScrollPhysics(_controller),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.blue,
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    child: Text('内层ListItem', style: TextStyle(fontSize: 20)),
                  );
                },
                itemCount: 10,
              ),
            );
          }
          return Container(
            height: 100,
            color: Colors.red,
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: Text('外层ListItem'),
          );
        },
      ),
    );
  }
}

class _ChildScrollPhysics extends ScrollPhysics {
  final ScrollController parentController;
  const _ChildScrollPhysics(this.parentController, {super.parent});

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // 子滚动先处理自身偏移
    final childProcessedOffset = super.applyPhysicsToUserOffset(
      position,
      offset,
    );

    // 检查子滚动是否到达边界
    final atTop =
        position.pixels <= position.minScrollExtent && childProcessedOffset > 0;
    final atBottom =
        position.pixels >= position.maxScrollExtent && childProcessedOffset < 0;

    if ((atTop || atBottom) && parentController.hasClients) {
      // 动态获取父滚动当前的物理效果（核心）
      final parentPosition = parentController.position;
      final parentPhysics = parentPosition.physics;

      // 计算传递给父滚动的偏移（方向反转）
      final parentOffset = childProcessedOffset;

      // 应用父滚动物理效果处理偏移
      final parentProcessedOffset = parentPhysics.applyPhysicsToUserOffset(
        parentPosition,
        parentOffset,
      );

      var oldPixels = parentPosition.pixels;
      var nPixels = oldPixels - parentProcessedOffset;
      final value = parentPhysics.applyBoundaryConditions(
        parentPosition,
        nPixels,
      );
      // 计算父滚动新位置并应用（使用animateTo确保物理效果生效）
      final newParentPixels = nPixels - value;
      parentController.jumpTo(newParentPixels);

      return 0; // 子滚动不再消耗偏移
    }

    return childProcessedOffset;
  }

  @override
  _ChildScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _ChildScrollPhysics(parentController, parent: buildParent(ancestor));
  }
}
