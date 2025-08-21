import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../game.dart';
import './map.dart';
import './rock.dart';

class Ember extends SpriteAnimationComponent
    with HasGameReference<OwnGame>, CollisionCallbacks, KeyboardHandler {
  static const double speed = 300;
  static final TextPaint textRenderer = TextPaint(
    style: const TextStyle(color: Colors.white70, fontSize: 12),
  );
  Ember({super.position, Vector2? size})
    : super(size: size ?? Vector2.all(50), priority: 2, anchor: Anchor.center);

  final Vector2 velocity = Vector2.zero();
  late final TextComponent positionText;
  late final Vector2 textPosition;
  late final maxPosition = Vector2.all(Map.size - size.x / 2);
  late final minPosition = -maxPosition;

  @mustCallSuper
  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'adventurer/ember.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(16),
        stepTime: 0.15,
      ),
    );
    positionText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 + 30,
      anchor: Anchor.center,
    );
    add(positionText);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    final deltaPosition = velocity * (speed * dt);
    position.add(deltaPosition);
    position.clamp(minPosition, maxPosition);
    positionText.text = '(${x.toInt()}, ${y.toInt()})';
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Rock) {
      other.add(
        ScaleEffect.to(
          Vector2.all(1.5),
          EffectController(duration: 0.2, alternate: true),
        ),
      );
    }
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyRepeatEvent) {
      return super.onKeyEvent(event, keysPressed);
    }
    final isKeyDown = event is KeyDownEvent;

    final bool handled;
    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      velocity.x = isKeyDown ? -1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      velocity.x = isKeyDown ? 1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      velocity.y = isKeyDown ? -1 : 0;
      handled = true;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      velocity.y = isKeyDown ? 1 : 0;
      handled = true;
    } else {
      handled = false;
    }

    if (handled) {
      angle = -velocity.angleToSigned(Vector2(1, 0));
      return false;
    } else {
      return super.onKeyEvent(event, keysPressed);
    }
  }
}
