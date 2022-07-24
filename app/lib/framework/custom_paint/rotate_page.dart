import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RotatePage extends StatelessWidget {
  const RotatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Rotate')),
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

    // 旋转默认是原点
    // 现在的原点是平移影响之后的（200，200）
    canvas.rotate(pi / 2);
    canvas.drawLine(
      const Offset(0, 0),
      const Offset(100, 100),
      paint..color = Colors.greenAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
