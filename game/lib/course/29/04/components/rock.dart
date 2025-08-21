import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import '../game.dart';

class Rock extends SpriteComponent
    with HasGameReference<OwnGame>, TapCallbacks {
  Rock(Vector2 position)
    : super(
        position: position,
        size: Vector2.all(50),
        priority: 1,
        anchor: Anchor.center,
      );

  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite('nine-box.png');
    paint = Paint()..color = Colors.white;
    add(RectangleHitbox());
  }

  @override
  void onTapDown(_) {
    add(
      ScaleEffect.to(
        Vector2.all(scale.x >= 2.0 ? 1 : 2),
        EffectController(duration: 0.3),
      ),
    );
  }
}
