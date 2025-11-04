import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';

class SketchPadExample07 extends StatelessWidget {
  const SketchPadExample07({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchPad();
  }
}

class SketchPad extends LeafRenderObjectWidget {
  const SketchPad({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSketchPad();
  }
}

class RenderSketchPad extends RenderBox {
  static Paint pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  static Paint pen2 = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  Image? _image;
  final Path _previous = Path();
  Path _current = Path();

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      _current.moveTo(event.localPosition.dx, event.localPosition.dy);
    } else if (event is PointerMoveEvent) {
      _current.lineTo(event.localPosition.dx, event.localPosition.dy);
      markNeedsPaint();
    } else if (event is PointerUpEvent) {
      _previous.addPath(_current, Offset.zero);
      _current = Path();
      PictureRecorder pictureRecorder = PictureRecorder();
      Canvas canvas = Canvas(pictureRecorder);
      canvas.drawPath(_previous, pen2);
      pictureRecorder.endRecording().toImage(2000, 2000).then((Image image) {
        _image = image;
        markNeedsPaint();
      });
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.drawColor(Colors.yellow[100]!, BlendMode.src);
    context.canvas.translate(offset.dx, offset.dy);

    if (_image != null) {
      final Stopwatch stopwatch1 = Stopwatch()..start();
      context.canvas.drawImage(_image!, offset, pen2);
      stopwatch1.stop();
      print('draw picture: ${stopwatch1.elapsedMicroseconds}');
    }

    final Stopwatch stopwatch2 = Stopwatch()..start();
    context.canvas.drawPath(_current, pen);
    stopwatch2.stop();
    print('draw current: ${stopwatch2.elapsedMicroseconds}');
  }

  @override
  void performLayout() {
    size = constraints.hasBoundedWidth && constraints.hasBoundedHeight
        ? constraints.biggest
        : const Size(300, 300);
  }

  @override
  bool hitTestSelf(Offset position) => true;
}
