import 'dart:async';
import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

import 'component.dart';

class OwnGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    final Vector2 fixSize = Vector2(90, 60);
    camera.viewport = FixedResolutionViewport(resolution: fixSize);
    add(Background());
    add(HeroMan()..position = size / 2);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    print(size);
  }
}

class Background extends PositionComponent with HasGameReference<OwnGame> {
  Background() : super(size: Vector2.all(100000));

  @override
  int get priority => -1;

  late Paint white;
  late final Rect hugeRect;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    white = BasicPalette.white.paint();
    hugeRect = size.toRect();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(hugeRect, white);
  }
}
