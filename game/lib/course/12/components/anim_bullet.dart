import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

import 'hero.dart';

enum BulletType { hero, monster }

class AnimBullet extends SpriteAnimationComponent {
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
}
