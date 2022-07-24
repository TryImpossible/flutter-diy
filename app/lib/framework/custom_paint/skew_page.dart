import 'dart:ui';

import 'package:flutter/material.dart';

class SkewPage extends StatelessWidget {
  const SkewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Skew')),
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
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 5;

    canvas.translate(200, 200);
    canvas.drawLine(const Offset(0, 0), const Offset(100, 100), paint);

    // 斜切
    canvas.skew(0, 1);
    // (0, 0) 新坐标 (0, 0)
    // (100, 100) 新坐标 (100, 200)）
    // x = 100 + 0 * 100
    // y = 100 + 1 * 100
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(100, 100),
      paint..color = Colors.greenAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
