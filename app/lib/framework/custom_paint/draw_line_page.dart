import 'dart:ui';

import 'package:flutter/material.dart';

class DrawLinePage extends StatefulWidget {
  const DrawLinePage({Key? key}) : super(key: key);

  @override
  State<DrawLinePage> createState() => _DrawLinePageState();
}

class _DrawLinePageState extends State<DrawLinePage>
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
      appBar: AppBar(title: const Text('DrawLine')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _MyPainter(_controller),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  const _MyPainter(this.animation) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5;

    canvas.translate(100, 0);
    canvas.drawLine(
      const Offset(10, 10),
      Offset(10 + 40 * animation.value, 10 + 60 * animation.value),
      paint,
    );
    canvas.drawLine(const Offset(50, 70), const Offset(100, 70), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
