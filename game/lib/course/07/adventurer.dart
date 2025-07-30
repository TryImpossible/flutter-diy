import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game/course/07/game.dart';

import 'liveable.dart';

class AdventurerComponent extends SpriteAnimationComponent
    with HasGameReference<OwnGame>, Liveable {
  AdventurerComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    initPaint(lifePoint: 1000, lifeColor: Colors.blue);
    List<Sprite> sprites = <Sprite>[];
    for (int i = 0; i <= 8; i++) {
      sprites.add(await game.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15, loop: true);
    animationTicker!.onComplete = _onLastFrame;
    position = game.size / 2;
  }

  void shoot() {
    animationTicker!.reset();
  }

  void flip({bool x = false, bool y = true}) {
    scale = Vector2(scale.x * (y ? -1 : 1), scale.y * (x ? -1 : 1));
  }

  void move(Vector2 ds) {
    position.add(ds);
  }

  void rotate(double deg) {
    angle = deg;
  }

  void _onLastFrame() {
    animationTicker!.currentIndex = 0;
    animationTicker!.update(0);
  }

  final double _speed = 100;

  void toTarget(Vector2 target) {
    removeAll(children.whereType<MoveEffect>());
    double timeMs = (target - position).length / _speed;
    add(MoveEffect.to(target, EffectController(duration: timeMs)));
  }
}
