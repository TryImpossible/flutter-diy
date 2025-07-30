import 'package:flame/components.dart';

class Bullet extends SpriteComponent {
  Bullet({required Sprite sprite, required this.maxRange})
    : super(sprite: sprite);

  final double _speed = 200;
  final double maxRange;

  double _length = 0;

  @override
  void update(double dt) {
    super.update(dt);
    Vector2 ds = Vector2(1, 0) * _speed * dt;
    _length += ds.length;
    position.add(ds);
    if (_length > maxRange) {
      _length = 0;
      removeFromParent();
    }
  }
}
