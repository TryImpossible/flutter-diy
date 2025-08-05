import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/circle.dart';
import 'components/line.dart';
import 'components/polygon.dart';

class OwnGame extends FlameGame with HasCollisionDetection, PanDetector {
  late Line line;
  late Circle circle;
  late Polygon polygon;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    circle = Circle(radius: 40, position: size / 2);
    line = Line(lineWidth: 120, position: size / 2 - Vector2(0, 140));
    polygon = Polygon(radius: 60, position: size / 2 + Vector2(0, 140));
    add(circle);
    add(line);
    add(polygon);
    add(ScreenHitbox());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    line.position += info.delta.global;
  }
}
