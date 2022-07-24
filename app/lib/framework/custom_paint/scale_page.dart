import 'dart:ui';

import 'package:flutter/material.dart';

class ScalePage extends StatelessWidget {
  const ScalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Scale')),
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

    // 最起始的状态：长度20*20 位置在原点（100,100）
    canvas.drawPoints(PointMode.points, [const Offset(100, 100)], paint);

    // 先扩大两倍：长度40*40 位置在（200，200）
    canvas.scale(2, 2);
    canvas.drawPoints(PointMode.points, [const Offset(100, 100)], paint);

    // 再扩大1.5倍：长度60*60 位置在（300，300）
    canvas.scale(1.5, 1.5);
    canvas.drawPoints(PointMode.points, [const Offset(100, 100)], paint);

    // canvas.scale(1, -1); // 沿X轴镜像
    // canvas.scale(-1, 1); // 沿Y轴镜像
    // canvas.scale(-1, -1); // 沿原点镜像
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
