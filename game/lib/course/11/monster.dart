import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import 'life.dart';
import 'liveable.dart';

class MonsterComponent extends SpriteAnimationComponent with Liveable {
  MonsterComponent({
    required SpriteAnimation animation,
    required Vector2 size,
    required Vector2 position,
    required this.life,
  }) : super(
         animation: animation,
         size: size,
         position: position,
         anchor: Anchor.topLeft,
       );

  final double life;

  @override
  Future<void> onLoad() async {
    initPaint(lifePoint: life);
    // add(RectangleHitbox()..debugMode = true);

    // LifeComponent lifeComponent = LifeComponent(
    //   lifePoint: life,
    //   lifeColor: Colors.red,
    //   position: position,
    //   size: size,
    // );
    // add(lifeComponent);
  }

  @override
  void onDied() {
    removeFromParent();
  }

  void move(Vector2 ds) {
    position.add(ds);
  }
}
