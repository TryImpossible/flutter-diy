import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashboardProgress extends StatefulWidget {
  const DashboardProgress({super.key});

  @override
  State<DashboardProgress> createState() => _DashboardProgressState();
}

class _DashboardProgressState extends State<DashboardProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final ValueNotifier<String?> time =
      ValueNotifier<String?>('2023-12-05 23:12:30');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: <Widget>[
        CustomPaint(
          painter: _DashboardPainter(
            progress: _controller.drive(CurveTween(curve: Curves.easeIn)),
            time: time,
          ),
          isComplex: true,
          size: Size.square(width),
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

extension on num {
  double toRadian() => this * (math.pi / 180);

  double toAngle() => this / (math.pi / 180);
}

class _DashboardPainter extends CustomPainter {
  final Animation<double> progress;
  final ValueNotifier<String?> time;

  _DashboardPainter({
    required this.progress,
    required this.time,
  }) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, size);
    _drawProgressMark(canvas, size);
    _drawProgressRing(canvas, size);
    _drawProgressText(canvas, size);
    _drawTimeText(canvas, size);
  }

  double _convert(Size size, num value) => value * (size.width / 296);

  void _drawBackground(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFFBFBFB)
      ..strokeWidth = _convert(size, 24);
    Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: (size.width - paint.strokeWidth) / 2,
    );
    canvas.drawArc(rect, 0, math.pi * 2, false, paint);

    rect = rect.deflate(paint.strokeWidth / 2);
    paint = paint
      ..color = const Color(0xFFF5F5F5)
      ..strokeWidth = _convert(size, 10);
    rect = rect.deflate(paint.strokeWidth / 2);
    canvas.drawArc(rect, 0, math.pi * 2, false, paint);

    rect = rect.deflate(paint.strokeWidth / 2);
    paint = paint
      ..color = const Color(0xFFEAEAEA)
      ..strokeWidth = 1;
    rect = rect.deflate(1 / 2).deflate(_convert(size, 8));
    canvas.drawArc(rect, 0, math.pi * 2, false, paint);

    for (int i = 1; i <= 4; i++) {
      rect = rect.deflate(1 / 2).deflate(_convert(size, 6));
      canvas.drawArc(rect, 0, math.pi * 2, false, paint);
    }
  }

  final double _strokeWidth = 2.0;
  final double _markLength = 8.0;
  final double _markWidth = 1.0;
  final int _totalMarks = 10;

  void _drawProgressMark(Canvas canvas, Size size) {
    const double startAngle = math.pi / 2 + math.pi / 3.2;
    const double sweepAngle = (math.pi * 2 - math.pi / (3.2 / 2));

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFF828282)
      ..strokeWidth = 1;

    Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: (size.width - _convert(size, 24) - paint.strokeWidth) / 2,
    );
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    final Offset center = size.center(Offset.zero);
    final double radius = size.width / 2 - _convert(size, 24) - _strokeWidth;

    final Paint tickPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFFD5D5D5)
      ..strokeWidth = _markWidth;

    final markAngle = sweepAngle / _totalMarks;
    for (int i = 0; i < _totalMarks - 1; i++) {
      final angle = startAngle + (i + 1) * markAngle;
      final startPoint = Offset(
        center.dx + (radius + _markLength) * math.cos(angle),
        center.dy + (radius + _markLength) * math.sin(angle),
      );
      final endPoint = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawLine(startPoint, endPoint, tickPaint);
    }
  }

  void _drawProgressRing(Canvas canvas, Size size) {
    const double startAngle = math.pi / 2 + math.pi / 3.2;
    final double sweepAngle =
        (math.pi * 2 - math.pi / (3.2 / 2)) * progress.value;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFF00E6A3)
      ..strokeWidth =
          _convert(size, 10 + 8) + 1 / 2 * 5 + _convert(size, 6) * 4;

    Rect rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: (size.width - _convert(size, 48) - paint.strokeWidth) / 2,
    );
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    rect = rect.inflate(paint.strokeWidth / 2);
    paint = paint
      ..color = const Color(0xFF00D593)
      ..strokeWidth = _convert(size, 10);
    rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: (size.width - _convert(size, 24 * 2) - paint.strokeWidth) / 2,
    );
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void _drawProgressText(Canvas canvas, Size size) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(100 * progress.value).toInt()}%',
        style: const TextStyle(
          fontSize: 58,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00E6A3),
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      maxWidth: size.width -
          (_convert(size, 24 + 10 + 8) + 1 / 2 * 5 + _convert(size, 6) * 4) * 2,
    );
    textPainter.paint(
      canvas,
      size.center(-textPainter.size.center(Offset.zero)),
    );
  }

  void _drawTimeText(Canvas canvas, Size size) {
    if (time.value?.isEmpty ?? true) {
      return;
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '上次检测\n',
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF828282),
          height: 1.6,
        ),
        children: <TextSpan>[
          TextSpan(
            text: time.value ?? '',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF828282),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    final double outerWidth =
        _convert(size, 24 + 10 + 8) + 1 / 2 * 5 + _convert(size, 6) * 4;
    textPainter.layout(
      maxWidth: size.width - outerWidth * 2,
    );

    final double dx = (size.width - textPainter.size.width) / 2;
    final double dy =
        outerWidth + (size.height - outerWidth * 2) - _convert(size, 12);
    textPainter.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
