import 'dart:ui';

import 'package:flutter/material.dart';

class DrawLinePage extends StatelessWidget {
  const DrawLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('DrawLine')),
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

    canvas.translate(100, 0);
    canvas.drawLine(const Offset(10, 10), const Offset(50, 70), paint);
    canvas.drawLine(const Offset(50, 70), const Offset(100, 70), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
