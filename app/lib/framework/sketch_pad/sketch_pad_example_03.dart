import 'package:flutter/material.dart';

class SketchPadExample03 extends StatefulWidget {
  const SketchPadExample03({super.key});

  @override
  State<SketchPadExample03> createState() => _SketchPadExample03State();
}

class _SketchPadExample03State extends State<SketchPadExample03> {
  Path _previous = Path();
  Path _current = Path();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        setState(() {
          _current.moveTo(details.localPosition.dx, details.localPosition.dy);
          _current.lineTo(
            details.localPosition.dx + 1,
            details.localPosition.dy + 1,
          );
        });
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          _current.lineTo(details.localPosition.dx, details.localPosition.dy);
        });
      },
      onPanEnd: (DragEndDetails details) {
        _previous.addPath(_current, Offset.zero);
        _current = Path();
      },
      child: CustomPaint(
        painter: _SketchPadPainter('previous', _previous),
        foregroundPainter: _SketchPadPainter('current', _current),
        child: Container(
          color: Colors.yellow[100]!.withAlpha((255 * 0.5).toInt()),
        ),
      ),
    );
  }
}

class _SketchPadPainter extends CustomPainter {
  _SketchPadPainter(this.id, this.path);

  final String id;
  final Path path;

  static Paint pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    print('painting: $id');
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
