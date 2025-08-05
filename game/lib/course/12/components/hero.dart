import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../game.dart';
import '../minixs/liveable.dart';
import 'adventurer.dart';
import 'bullet.dart';
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

class Hero extends PositionComponent with HasGameReference<OwnGame> {
  Hero({
    required this.attr,
    required this.animation,
    required Vector2 position,
    required Vector2 size,
  }) : super(size: size, position: position, anchor: Anchor.center);

  final HeroAttr attr;
  final SpriteAnimation animation;

  late Adventurer adventurer;
  late Life life;
  late final Sprite bulletSprite;

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
    bulletSprite = await game.loadSprite('adventurer/weapon_arrow.png');
    add(adventurer);
    add(life);
  }

  /// 添加子弹
  void addBullet() {
    Bullet bullet = Bullet(
      sprite: bulletSprite,
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
}
