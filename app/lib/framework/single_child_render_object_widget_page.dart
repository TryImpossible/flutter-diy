import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingleChildRenderObjectWidgetPage extends StatelessWidget {
  const SingleChildRenderObjectWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildRenderObjectWidget'),
      ),
      body: Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.lightBlueAccent,
          child: SimpleContainer(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Simple Container Clicked'),
                  duration: Duration(milliseconds: 300),
                ),
              );
            },
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('child clicked'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellowAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleContainer extends SingleChildRenderObjectWidget {
  const SimpleContainer({
    super.key,
    required super.child,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSimpleContainer()..onTap = onTap;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderObject renderObject,
  ) {
    if (renderObject is _RenderSimpleContainer) {
      renderObject.onTap = onTap;
    }
  }
}

class _RenderSimpleContainer extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  VoidCallback? onTap;

  BoxParentData _getChildParentData() {
    return child!.parentData as BoxParentData;
  }

  @override
  void performLayout() {
    size = const Size(200, 200);
    final BoxConstraints childConstraints =
        BoxConstraints(maxWidth: size.width, maxHeight: size.height);
    child!.layout(childConstraints, parentUsesSize: true);

    final double dx = (size.width - child!.size.width) / 2;
    final double dy = (size.height - child!.size.height) / 2;
    _getChildParentData().offset = Offset(dx, dy);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // 绘制自己的大小和位置
    if (size > Size.zero) {
      context.canvas.drawRect(
        offset & size,
        Paint()..color = Colors.greenAccent,
      );
    }
    // 绘制子控件
    if (child != null) {
      context.paintChild(child!, offset + _getChildParentData().offset);
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    /// Flutter的事件处理机制, 事件分发根据Render树从上到下深度遍历访问每一个RenderBox的hitTest做命中测试,
    /// 如果在这个方法里调用 `result.add(BoxHitTestEntry(this, position));` 则这个Renderbox则可以收到事件, 事件会发送到handleEvent方法中.
    /// 只要在hitTest中返回了true, 则表示这个事件被消耗了, 被消耗后不会再继续测试其它Renderbox是否接收此事件

    if (size.contains(position)) {
      // if (hitTestChildren(result, position: position) ||
      //     hitTestSelf(position)) {
      //   result.add(BoxHitTestEntry(this, position));
      //   return true;
      // }

      if (child!
          .hitTest(result, position: position - _getChildParentData().offset)) {
        return true;
      } else {
        result.add(BoxHitTestEntry(this, position));
        return true;
      }
    }
    return false;
  }

  @override
  void handleEvent(
    PointerEvent event,
    covariant HitTestEntry<HitTestTarget> entry,
  ) {
    if (event is PointerDownEvent) {
      onTap?.call();
    }
  }
}
