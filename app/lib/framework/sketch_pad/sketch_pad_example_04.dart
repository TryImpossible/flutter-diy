import 'package:flutter/material.dart';

class SketchPadExample04 extends StatefulWidget {
  const SketchPadExample04({super.key});

  @override
  State<SketchPadExample04> createState() => _SketchPadExample04State();
}

class _SketchPadExample04State extends State<SketchPadExample04> {
  final ValueNotifier<Path> _previous = ValueNotifier<Path>(Path());
  final ValueNotifier<Path> _current = ValueNotifier<Path>(Path());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        _current.value.moveTo(
          details.localPosition.dx,
          details.localPosition.dy,
        );
        _current.value.lineTo(
          details.localPosition.dx + 1,
          details.localPosition.dy + 1,
        );
      },
      onPanUpdate: (DragUpdateDetails details) {
        _current.value.lineTo(
          details.localPosition.dx,
          details.localPosition.dy,
        );
        _current.notifyListeners();
      },
      onPanEnd: (DragEndDetails details) {
        _previous.value.addPath(_current.value, Offset.zero);
        _current.value = Path();
        for (int i = 0; i < 100; i += 20) {
          Future.delayed(Duration(milliseconds: i), () {
            _previous.notifyListeners();
          });
        }
      },
      child: Stack(
        children: <Widget>[
          RepaintBoundary(
            child: CustomPaint(
              isComplex: true,
              willChange: false,
              painter: _SketchPadPainter('previous', _previous),
              size: Size.infinite,
            ),
          ),
          Container(color: Colors.yellow[100]),
          RepaintBoundary(
            child: CustomPaint(
              willChange: true,
              painter: _SketchPadPainter('current', _current),
              size: Size.infinite,
            ),
          ),
        ],
      ),
    );
  }
}

class _SketchPadPainter extends CustomPainter {
  _SketchPadPainter(this.id, this.path) : super(repaint: path);

  final String id;
  final ValueNotifier<Path> path;

  static Paint pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    print('painting: $id');
    canvas.drawPath(path.value, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
