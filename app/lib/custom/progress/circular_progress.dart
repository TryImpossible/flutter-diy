import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomPaint(
          painter: _CircularProgressPainter(
            progress: _controller.drive(CurveTween(curve: Curves.easeIn)),
          ),
          isComplex: true,
          size: widget.size,
        ),
        ElevatedButton(
          onPressed: () {
            _controller
              ..reset()
              ..forward();
          },
          child: const Text('开始'),
        ),
      ],
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  _CircularProgressPainter({
    required this.progress,
  }) : super(repaint: progress);

  final Animation<double> progress;

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircularRing(canvas, size);
    _drawProgressRing(canvas, size);
    _drawProgressText(canvas, size);
  }

  /// 绘制圆环
  void _drawCircularRing(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.redAccent.withOpacity(0.3)
      ..strokeWidth = 20;
    final Offset center = size.center(Offset.zero);
    final double radius = (size.width - 20) / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, 0, 2 * math.pi, false, paint);
  }

  /// 绘制进度圆环
  void _drawProgressRing(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      // ..color = Colors.redAccent
      ..strokeWidth = 20
      ..shader = ui.Gradient.linear(
        Offset.zero,
        size.bottomRight(Offset.zero),
        <Color>[Colors.redAccent, Colors.greenAccent, Colors.blueAccent],
        <double>[0.0, 0.5, 1.0],
      );
    final Offset center = size.center(Offset.zero);
    final double radius = (size.width - 20) / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * progress.value,
      false,
      paint,
    );
  }

  /// 绘制进度文字
  void _drawProgressText(Canvas canvas, Size size) {
    final String p = '${(progress.value * 100).toInt()}%';
    const TextStyle style = TextStyle(fontSize: 28, color: Colors.redAccent);
    final TextPainter painter = TextPainter(
      text: TextSpan(text: p, style: style),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    painter.layout(maxWidth: size.width);

    final Offset offset =
        size.center(Offset.zero) - painter.size.center(Offset.zero);
    painter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
