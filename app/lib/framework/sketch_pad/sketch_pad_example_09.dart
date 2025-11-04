import 'dart:ui';

import 'package:flutter/rendering.dart';

final pen = Paint()
  ..color = Color(0xff000000)
  ..strokeWidth = 4.0;

final pen2 = Paint()
  ..color = Color(0xffadadad)
  ..strokeWidth = 4.0;

final Path previous = Path();
Path current = Path();
var _retained;

void runSketchPadExample09() {
  PlatformDispatcher.instance.onBeginFrame = onBeginFrame;
  PlatformDispatcher.instance.onPointerDataPacket = onPointerDataPacket;
  PlatformDispatcher.instance.scheduleFrame();
}

void onPointerDataPacket(PointerDataPacket packet) {
  for (final PointerData data in packet.data) {
    final Offset position = Offset(data.physicalX, data.physicalY);
    if (data.change == PointerChange.down) {
      print('down $position');
      current.moveTo(position.dx, position.dy);
    } else if (data.change == PointerChange.move) {
      print('move $position');
      current.lineTo(position.dx, position.dy);
      PlatformDispatcher.instance.scheduleFrame();
    } else if (data.change == PointerChange.up) {
      print('up $position');
      previous.addPath(current, Offset.zero);
      current = Path();

      final PictureRecorder recorder = PictureRecorder();
      final Canvas canvas = Canvas(recorder);
      canvas.drawPath(previous, pen2);
      final Picture picture = recorder.endRecording();
      final PictureLayer layer = PictureLayer(
        Offset.zero &
            (PlatformDispatcher.instance.implicitView?.physicalSize ??
                Size.zero),
      );
      layer.picture = picture;

      final SceneBuilder builder = SceneBuilder();
      final OffsetEngineLayer engineLayer = builder.pushOffset(0, 0);
      layer.addToScene(builder);
      builder.pop();

      _retained = engineLayer;
      PlatformDispatcher.instance.scheduleFrame();
    }
  }
}

void onBeginFrame(Duration duration) {
  final PictureRecorder recorder = PictureRecorder();
  final Canvas canvas = Canvas(recorder);

  canvas.drawColor(Color(0xFFFFFDE7), BlendMode.src);
  canvas.drawPath(current, pen);

  final Picture picture = recorder.endRecording();
  final SceneBuilder sceneBuilder = SceneBuilder();
  if (_retained != null) {
    sceneBuilder.addRetained(_retained!);
  }
  sceneBuilder.addPicture(Offset.zero, picture);

  PlatformDispatcher.instance.implicitView?.render(sceneBuilder.build());
}
