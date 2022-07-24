import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DrawArcPage extends StatelessWidget {
  const DrawArcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('DrawArc')),
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
    Paint paint = Paint()..strokeWidth = 5;

    canvas.translate(100, 0);

    // rect: 是椭圆的外接矩形，因此椭圆的长短轴之比就是矩形的宽高比。
    // startAngle: 开始绘制圆环的角度，注意：x轴的角度是0度，并且必须是弧度制
    // sweepAngle: 圆环的角度大小，也是弧度制
    // useCenter: 终点是否和圆心连接起来
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(60, 80), width: 80, height: 40),
      pi / 2,
      pi / 2 + pi / 4,
      true,
      paint..color = Colors.redAccent,
    );
    canvas.drawCircle(
      const Offset(60, 80),
      40,
      paint..color = Colors.red.withOpacity(0.2),
    );

    canvas.drawArc(
      Rect.fromCenter(center: const Offset(60, 180), width: 80, height: 40),
      pi / 2,
      pi / 2 + pi / 4,
      false,
      paint..color = Colors.redAccent,
    );
    canvas.drawCircle(
      const Offset(60, 180),
      40,
      paint..color = Colors.red.withOpacity(0.2),
    );

    canvas.drawArc(
      Rect.fromCenter(center: const Offset(60, 280), width: 80, height: 40),
      pi / 2,
      pi / 2 + pi / 4,
      false,
      paint..color = Colors.redAccent,
    );
    canvas.drawCircle(
      const Offset(60, 280),
      40,
      paint..color = Colors.red.withOpacity(0.2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
