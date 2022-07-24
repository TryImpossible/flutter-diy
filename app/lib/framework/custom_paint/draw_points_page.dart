import 'dart:ui';

import 'package:flutter/material.dart';

class DrawPointsPage extends StatelessWidget {
  const DrawPointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('DrawPoints')),
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

    List<Offset> offsets = [
      const Offset(0, 0),
      const Offset(10, 10),
      const Offset(30, 30),
      const Offset(50, 50),
      const Offset(70, 70),
    ];
    canvas.drawPoints(PointMode.points, offsets, paint);

    canvas.translate(0, 200);
    // 只有两个拆线，最后一个点不绘制
    canvas.drawPoints(PointMode.lines, offsets, paint);

    canvas.translate(0, 200);
    canvas.drawPoints(PointMode.polygon, offsets, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
