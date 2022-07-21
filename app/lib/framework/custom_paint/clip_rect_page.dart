import 'package:flutter/material.dart';

class ClipRectPage extends StatelessWidget {
  const ClipRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('ClipRect')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _MyPainter(),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
      Paint()..color = Colors.red,
    );

    Rect rect = Rect.fromPoints(const Offset(30, 30), const Offset(100, 100));
    // canvas.clipRect(rect);

    /// 返回个矩形相交的区域
    Rect newRect = rect.intersect(
        Rect.fromPoints(const Offset(80, 80), const Offset(150, 150)));
    canvas.clipRect(newRect);

    canvas.drawRect(
      Rect.fromPoints(
        const Offset(30, 30),
        Offset(size.width, size.height),
      ),
      Paint()..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
