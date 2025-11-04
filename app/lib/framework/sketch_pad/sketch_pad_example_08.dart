import 'dart:ui';

final pen = Paint()
  ..color = Color(0xff000000)
  ..strokeWidth = 4.0;

final List<Offset?> points = <Offset?>[];

void runSketchPadExample08() {
  PlatformDispatcher.instance.onBeginFrame = onBeginFrame;
  PlatformDispatcher.instance.onPointerDataPacket = onPointerDataPacket;
  PlatformDispatcher.instance.scheduleFrame();
}

void onPointerDataPacket(PointerDataPacket packet) {
  for (final PointerData data in packet.data) {
    final Offset position = Offset(data.physicalX, data.physicalY);
    if (data.change == PointerChange.down) {
      print('down $position');
    } else if (data.change == PointerChange.move) {
      print('move $position');
      points.add(position);
    } else if (data.change == PointerChange.up) {
      print('up $position');
      points.add(null);
    }
  }
}

void onBeginFrame(Duration duration) {
  final PictureRecorder recorder = PictureRecorder();
  final Canvas canvas = Canvas(recorder);

  canvas.drawColor(Color(0xFFFFFDE7), BlendMode.src);

  for (int i = 0; i < points.length - 1; i++) {
    if (points[i] != null && points[i + 1] != null) {
      canvas.drawLine(points[i]!, points[i + 1]!, pen);
    }
  }

  final Picture picture = recorder.endRecording();
  final SceneBuilder sceneBuilder = SceneBuilder()
    ..addPicture(Offset.zero, picture);

  PlatformDispatcher.instance.implicitView?.render(sceneBuilder.build());
  PlatformDispatcher.instance.scheduleFrame();
}
