import 'dart:ui';

final pen = Paint()
  ..color = Color(0xff000000)
  ..strokeWidth = 4.0;

final pen2 = Paint()
  ..color = Color(0xffadadad)
  ..strokeWidth = 4.0;

final List<Offset?> points = <Offset?>[];
var _retained;

void runSketchPadExample10() {
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
      PlatformDispatcher.instance.scheduleFrame();
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

  if (points.isNotEmpty) {
    final Offset? last = points.last;
    points.clear();
    points.add(last);
  }

  final Picture picture = recorder.endRecording();

  final SceneBuilder sceneBuilder = SceneBuilder();
  final OpacityEngineLayer current = sceneBuilder.pushOpacity(250);
  if (_retained != null) {
    sceneBuilder.addRetained(_retained!);
  }
  sceneBuilder.addPicture(Offset.zero, picture);
  sceneBuilder.pop();
  _retained = current;

  final Scene scene = sceneBuilder.build();
  PlatformDispatcher.instance.implicitView?.render(scene);
}
