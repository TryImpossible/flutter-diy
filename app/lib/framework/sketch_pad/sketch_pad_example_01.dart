import 'package:flutter/material.dart';

class SketchPadExample01 extends StatefulWidget {
  const SketchPadExample01({super.key});

  @override
  State<SketchPadExample01> createState() => _SketchPadExample01State();
}

class _SketchPadExample01State extends State<SketchPadExample01> {
  final List<Offset?> _points = <Offset?>[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          _points.add(details.localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) {
        setState(() {
          _points.add(null);
        });
      },
      child: CustomPaint(
        foregroundPainter: _SketchPadPainter(_points),
        child: Container(color: Colors.yellow[100]),
      ),
    );
  }
}

class _SketchPadPainter extends CustomPainter {
  _SketchPadPainter(this.points);

  final List<Offset?> points;

  static Paint pen = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    Offset? previousPoint;
    for (final Offset? point in points) {
      if (point != null && previousPoint != null) {
        canvas.drawLine(previousPoint, point, pen);
      }
      previousPoint = point;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
