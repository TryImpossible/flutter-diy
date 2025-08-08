import 'dart:async';

import 'package:flame/components.dart';

import '../game.dart';

class Adventurer extends SpriteAnimationComponent
    with HasGameReference<OwnGame> {
  Adventurer() : super(size: Vector2(50, 37), anchor: Anchor.center);
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    List<Sprite> sprites = <Sprite>[];
    for (var i = 0; i <= 8; i++) {
      sprites.add(await game.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.15,
      loop: false,
    );
    animationTicker!.onComplete = _onLastFrame;

    playing = false;
    position = game.size / 2;
  }

  void shoot() {
    playing = false;
    animationTicker!.reset();
  }

  void flip({bool x = false, bool y = true}) {
    scale = Vector2(scale.x * (y ? -1 : 1), scale.y * (x ? -1 : 1));
  }

  void move(Vector2 ds) {
    position.add(ds);
  }

  void rotateTo(double deg) {
    angle = deg;
  }

  void _onLastFrame() {
    animationTicker!.currentIndex = 0;
    animationTicker!.update(0);
  }
}
