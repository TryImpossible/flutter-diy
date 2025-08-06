import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart' show Color, Paint;

import '../game.dart';
import 'hero.dart';
import 'monster.dart';

enum BulletType { hero, monster }

class AnimBullet extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference<OwnGame> {
  AnimBullet({
    required SpriteAnimation animation,
    required this.speed,
    required this.maxRange,
    required this.type,
    required this.isLeft,
    required this.attr,
  }) : super(animation: animation);

  final double speed;
  final double maxRange;
  final BulletType type;
  final bool isLeft;
  final HeroAttr attr;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    switch (type) {
      case BulletType.hero:
        if (!isLeft) angle = pi;
        break;
      case BulletType.monster:
        if (isLeft) angle = pi;
        break;
    }

    final ShapeHitbox hitbox = RectangleHitbox();
    // hitbox.debugMode = true;
    add(hitbox);
  }

  double _length = 0;

  @override
  void update(double dt) {
    super.update(dt);
    final Vector2 ds = Vector2(isLeft ? 1 : -1, 0) * speed * dt;
    _length += ds.length;
    position.add(ds);
    if (_length > maxRange) {
      _length = 0;
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (type == BulletType.hero && other is Monster) {
      removeFromParent();
      createParticle(position + Vector2(size.x / 2, 0));
    }
    if (type == BulletType.monster && other is Hero) {
      removeFromParent();
    }
  }

  final Random _random = Random();

  Vector2 randomVector() {
    Vector2 base = Vector2.random();
    Vector2 fix = Vector2(-0.5, -0.5);
    base = base + fix;
    return base * 200;
  }

  Color randomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(255),
      _random.nextInt(255),
      _random.nextInt(255),
    );
  }

  void createParticle(Vector2 position) {
    CircleParticle circleParticle = CircleParticle(
      radius: 2,
      paint: Paint()..color = randomColor(),
    );
    Particle particle = Particle.generate(
      count: 10,
      lifespan: 1,
      generator: (int i) {
        return AcceleratedParticle(
          child: circleParticle,
          acceleration: randomVector(),
          speed: randomVector(),
          position: position,
        );
      },
    );
    ParticleSystemComponent psc = ParticleSystemComponent(particle: particle);
    game.add(psc);
  }
}
