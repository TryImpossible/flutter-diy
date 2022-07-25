import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedPathPage extends StatefulWidget {
  const AnimatedPathPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPathPage> createState() => _AnimatedPathPageState();
}

class _AnimatedPathPageState extends State<AnimatedPathPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPath')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _AnimatedPathPainter(_controller),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

/// 点的移动和线的绘制
class _AnimatedPathPainter extends CustomPainter {
  _AnimatedPathPainter(this.animation) : super(repaint: animation) {
    _initPoints();
  }

  final Animation<double> animation;

  List<Offset> points = [];

  void _initPoints() {
    for (int i = 0; i < 360; i++) {
      double thta = _convert(i); //第一处
      double p = _calY(thta); //第二处
      points.add(Offset(p * cos(thta), p * sin(thta))); //第三处
    }
  }

  double _calY(double x) {
    return 50 * (pow(e, cos(x)) - 2 * cos(4 * x)) + pow(sin(x / 12), 5); //第二处
  }

  double _convert(int x) {
    return pi / 180 * x;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 3;

    // canvas.drawPoints(PointMode.points, points, paint);

    Path path = Path();
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    PathMetrics metrics = path.computeMetrics();
    metrics.forEach((element) {
      Path path =
          element.extractPath(0, element.length * animation.value); //第一处
      canvas.drawPath(path, paint); //第二处
    });
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
