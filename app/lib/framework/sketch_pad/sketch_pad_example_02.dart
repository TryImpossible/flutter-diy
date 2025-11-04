import 'package:flutter/material.dart';

class SketchPadExample02 extends StatefulWidget {
  const SketchPadExample02({super.key});

  @override
  State<SketchPadExample02> createState() => _SketchPadExample02State();
}

class _SketchPadExample02State extends State<SketchPadExample02> {
  final List<Path> _paths = <Path>[];
  Path? _current;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        setState(() {
          _current = Path();
          _current!.moveTo(details.localPosition.dx, details.localPosition.dy);
          _current!.lineTo(
            details.localPosition.dx + 1,
            details.localPosition.dy + 1,
          );
          _paths.add(_current!);
        });
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          _current!.lineTo(details.localPosition.dx, details.localPosition.dy);
        });
      },
      onPanEnd: (DragEndDetails details) {
        _current = null;
      },
      child: CustomPaint(
        foregroundPainter: _SketchPadPainter(_paths),
        child: Container(color: Colors.yellow[100]),
      ),
    );
  }
}

class _SketchPadPainter extends CustomPainter {
  _SketchPadPainter(this.paths);

  final List<Path> paths;

  static Paint pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    for (final Path path in paths) {
      canvas.drawPath(path, pen);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
