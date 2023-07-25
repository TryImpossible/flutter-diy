import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderObjectButtonPage extends StatelessWidget {
  const RenderObjectButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RenderObjectButton'),
      ),
      body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.only(top: 80),
        alignment: Alignment.topCenter,
        child: RenderObjectButton(
          width: 200,
          height: 50,
          color: Colors.blue,
          borderRadius: 10,
          shadowBlurRadius: 5,
          shadowColor: Colors.black.withOpacity(0.5),
          child: const Text(
            'Custom Button',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            const SnackBar snackBar = SnackBar(
              content: Text('点击了'),
              duration: Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}

class RenderObjectButton extends SingleChildRenderObjectWidget {
  const RenderObjectButton({
    super.key,
    super.child,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
    required this.shadowBlurRadius,
    required this.shadowColor,
    this.onTap,
  });

  final double width;
  final double height;
  final Color color;
  final double borderRadius;
  final double shadowBlurRadius;
  final Color shadowColor;
  final VoidCallback? onTap;

  @override
  RenderObject createRenderObject(BuildContext context) {
    // 创建 RenderObject
    final _RenderButton renderButton = _RenderButton();
    updateRenderObject(context, renderButton);
    return renderButton;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderObject renderObject,
  ) {
    // 更新 RenderObject
    if (renderObject is _RenderButton) {
      renderObject
        ..width = width
        ..height = height
        ..color = color
        ..borderRadius = borderRadius
        ..shadowBlurRadius = shadowBlurRadius
        ..shadowColor = shadowColor
        ..onTap = onTap;
    }
  }
}

class _RenderButton extends RenderBox with RenderObjectWithChildMixin {
  late double width;
  late double height;
  late Color color;
  late double borderRadius;
  late double shadowBlurRadius;
  late Color shadowColor;
  late VoidCallback? onTap;

  @override
  void performLayout() {
    // super.performLayout();
    // 计算和设置子节点的位置和大小
    // 使用constraints来确定布局约束条件
    // 使用child.layout方法来计算子节点的布局
    // 使用child.size来设置子节点的大小

    if (child != null) {
      child!.layout(constraints, parentUsesSize: true);
      size = (child as RenderBox).size;
    } else {
      size = constraints.smallest;
    }
    Size minSize = Size(width, height);
    if (minSize > size) {
      size = minSize;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // super.paint(context, offset);
    // 绘制组件的外观
    // 使用context.canvas来进行绘制操作
    // 使用offset来确定绘制的起始位置

    final canvas = context.canvas;

    final rect = offset & size;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);

    if (child == null) {
      return;
    }
    final Size childSize = (child as RenderBox).size;

    context.paintChild(
      child!,
      offset.translate(
        (width - childSize.width) / 2,
        (height - childSize.height) / 2,
      ),
    );
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    // 处理触摸事件的命中测试
    // 使用result.add方法将命中的RenderObject添加到结果中
    // 使用position来确定触摸事件的位置
    // final bool flag = super.hitTest(result, position: position);
    final bool flag = (position.dx >= 0 &&
        position.dx <= size.width &&
        position.dy >= 0 &&
        position.dy <= size.height);
    if (flag) {
      onTap?.call();
    }
    return flag;
  }
}
