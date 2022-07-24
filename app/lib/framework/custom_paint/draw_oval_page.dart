import 'dart:ui';

import 'package:flutter/material.dart';

class DrawOvalPage extends StatelessWidget {
  const DrawOvalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('DrawOval')),
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

    canvas.drawOval(
      Rect.fromCenter(center: const Offset(20, 80), width: 20, height: 40),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(center: const Offset(60, 80), width: 40, height: 20),
      paint,
    );

    canvas.drawOval(
      Rect.fromCenter(center: const Offset(100, 80), width: 20, height: 20),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
