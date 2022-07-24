import 'dart:ui';

import 'package:flutter/material.dart';

class DrawRectPage extends StatelessWidget {
  const DrawRectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('DrawRect')),
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

    // 根据四个点生成
    canvas.drawRect(const Rect.fromLTRB(20, 100, 80, 200), paint);

    // 根据定点和宽高
    canvas.drawRect(const Rect.fromLTWH(100, 100, 60, 100), paint);

    // 根据点心和宽度
    canvas.drawRect(
      Rect.fromCenter(center: const Offset(50, 300), width: 60, height: 100),
      paint,
    );

    // 根据内接圆
    canvas.drawRect(
      Rect.fromCircle(center: const Offset(130, 300), radius: 20),
      paint,
    );

    // 根据对角线坐标
    canvas.drawRect(
      Rect.fromPoints(const Offset(20, 410), const Offset(80, 510)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
