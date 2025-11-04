import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SketchPadExample05 extends StatefulWidget {
  const SketchPadExample05({super.key});

  @override
  State<SketchPadExample05> createState() => _SketchPadExample05State();
}

class _SketchPadExample05State extends State<SketchPadExample05> {
  final GlobalKey _globalKey = GlobalKey();
  Uint8List? _bytes;
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
        () async {
          final RenderRepaintBoundary boundary =
              _globalKey.currentContext!.findRenderObject()!
                  as RenderRepaintBoundary;
          final ui.Image image = await boundary.toImage(
            pixelRatio: MediaQuery.devicePixelRatioOf(context),
          );
          final ByteData? byteData = await image.toByteData(
            format: ui.ImageByteFormat.png,
          );
          final Uint8List imageBytes = byteData!.buffer.asUint8List();
          setState(() {
            _bytes = imageBytes;
          });
          _current.value = Path();
        }();
      },
      child: RepaintBoundary(
        key: _globalKey,
        child: Stack(
          children: <Widget>[
            Container(color: Colors.yellow[100]),
            if (_bytes != null) Image.memory(_bytes!, gaplessPlayback: true),
            RepaintBoundary(
              child: CustomPaint(
                willChange: true,
                painter: _SketchPadPainter('current', _current),
                size: Size.infinite,
              ),
            ),
          ],
        ),
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
