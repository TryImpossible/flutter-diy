import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

class Bullet extends SpriteComponent {
  Bullet({
    required Sprite sprite,
    required this.maxRange,
    required this.speed,
    this.isLeft = true,
  }) : super(sprite: sprite);

  final double maxRange;
  final double speed;
  final bool isLeft;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    if (!isLeft) {
      angle = pi;
    }
  }

  double _length = 0;

  @override
  void update(double dt) {
    super.update(dt);
    Vector2 ds = Vector2(isLeft ? 1 : -1, 0) * speed * dt;
    _length += ds.length;
    position.add(ds);
    if (_length > maxRange) {
      _length = 0;
      removeFromParent();
    }
  }
}
