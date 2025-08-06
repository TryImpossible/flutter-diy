import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../game.dart';
import 'adventurer.dart';
import 'anim_bullet.dart';
import 'life.dart';

class HeroAttr {
  const HeroAttr({
    required this.life,
    required this.speed,
    required this.attackSpeed,
    required this.attackRange,
    required this.attack,
    required this.crit,
    required this.critDamage,
  });
  final double life; // 生命值
  final double speed; // 速度
  final double attackSpeed; // 攻击速度
  final double attackRange; // 射程
  final double attack; // 攻击力
  final double crit; // 暴击率
  final double critDamage; // 暴击伤害
}

class Hero extends PositionComponent
    with HasGameReference<OwnGame>, CollisionCallbacks {
  Hero({
    required this.attr,
    required this.animation,
    required this.bulletAnimation,
    required Vector2 position,
    required Vector2 size,
  }) : super(size: size, position: position, anchor: Anchor.center);

  final HeroAttr attr;
  final SpriteAnimation animation;
  final SpriteAnimation bulletAnimation;

  late Adventurer adventurer;
  late Life life;

  bool isLeft = true;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    adventurer = Adventurer(
      spriteAnimation: animation,
      size: size,
      onLastFrame: addBullet,
    );
    adventurer.position = adventurer.size / 2;
    life = Life(
      lifePoint: attr.life,
      lifeColor: Colors.blue,
      position: adventurer.position,
      size: adventurer.size,
    );
    add(adventurer);
    add(life);
    addHitbox();
  }

  void addHitbox() {
    Vector2 boxSize = Vector2(size.x * 0.5, size.y * 0.8);
    double offsetFixY = -size.y * 0.11;
    ShapeHitbox hitbox = RectangleHitbox(
      size: boxSize,
      anchor: Anchor.center,
      position: size / 2 - Vector2(0, offsetFixY),
    );
    hitbox.debugMode = true;
    add(hitbox);
  }

  /// 添加子弹
  void addBullet() {
    AnimBullet bullet = AnimBullet(
      animation: bulletAnimation,
      type: BulletType.hero,
      attr: attr,
      maxRange: attr.attackRange,
      speed: attr.attackSpeed,
      isLeft: isLeft,
    );
    bullet.size = Vector2(32, 32);
    bullet.anchor = Anchor.center;
    bullet.position = position - Vector2(0, -4);
    game.add(bullet);
  }

  void flip({bool x = false, bool y = true}) {
    adventurer.flip(x: x, y: y);
    isLeft = !isLeft;
  }

  void shoot() {
    adventurer.shoot();
  }

  void move(Vector2 ds) {
    position.add(ds);
  }

  void _checkFlip(Vector2 target) {
    if (target.x < position.x) {
      if (isLeft) {
        flip();
      }
    }
    if (target.x > position.x) {
      if (!isLeft) {
        flip();
      }
    }
  }

  void toTarget(Vector2 target) {
    _checkFlip(target);
    removeAll(children.whereType<MoveEffect>());
    double timeMs = (target - position).length / attr.speed;
    add(MoveEffect.to(target, EffectController(duration: timeMs)));
  }

  void loss(HeroAttr attr) {
    life.loss(
      attr,
      onDied: () {
        removeFromParent();
      },
    );
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is AnimBullet && other.type == BulletType.monster) {
      loss(other.attr);
    }
  }
}
