import 'package:flutter/material.dart';

class PainterUsagePage extends StatelessWidget {
  const PainterUsagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 绘制内容的层级上：自底向上依次是 painter ——> child ——> foregroundPainter，
    /// 上面的内容会把下面的内容覆盖
    return Scaffold(
      appBar: AppBar(
        title: const Text('PainterUsage'),
      ),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: const _MyPainter(false),
            foregroundPainter: const _MyPainter(true),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  const _MyPainter(this.isForeground);

  final bool isForeground;

  @override
  void paint(Canvas canvas, Size size) {
    if (isForeground) {
      canvas.clipRect(const Rect.fromLTWH(0, 0, 100, 100));
    } else {
      canvas.clipRect(const Rect.fromLTWH(0, 0, 300, 300));
    }

    Paint paint = Paint()
      ..color = isForeground ? Colors.red : Colors.pinkAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
