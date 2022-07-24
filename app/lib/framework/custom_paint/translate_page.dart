import 'dart:ui';

import 'package:flutter/material.dart';

class TranslatePage extends StatelessWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Translate')),
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
      ..strokeWidth = 20;

    // 平移之前
    canvas.drawPoints(PointMode.points, [const Offset(0, 0)], paint);

    canvas.translate(size.width / 2, size.height / 2);

    // 平移之后
    canvas.drawPoints(PointMode.points, [const Offset(0, 0)], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
