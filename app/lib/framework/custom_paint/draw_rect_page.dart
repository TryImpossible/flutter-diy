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

    // 根据四个点生成
    canvas.drawRect(const Rect.fromLTRB(20, 20, 80, 120), paint);

    // 根据定点和宽高
    canvas.drawRect(const Rect.fromLTWH(100, 20, 60, 100), paint);

    // 根据点心和宽度
    canvas.drawRect(
      Rect.fromCenter(center: const Offset(50, 180), width: 60, height: 100),
      paint,
    );

    // 根据内接圆
    canvas.drawRect(
      Rect.fromCircle(center: const Offset(130, 180), radius: 20),
      paint,
    );

    // 根据对角线坐标
    canvas.drawRect(
      Rect.fromPoints(const Offset(20, 240), const Offset(80, 340)),
      paint,
    );

    // 绘制圆角矩形环
    canvas.drawDRRect(
      RRect.fromRectXY(
        size.topRight(const Offset(-20, 20)) & const Size(-60, 60),
        10.0,
        10.0,
      ),
      RRect.fromRectXY(
        size.topRight(const Offset(-20, 20)) & const Size(-60, 60),
        60.0,
        60.0,
      ),
      paint,
    );

    // 绘制圆角矩形
    canvas.drawRRect(
      RRect.fromLTRBR(
        size.width - 80,
        size.height - 120,
        size.width - 20,
        size.height - 20,
        const Radius.circular(10),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
