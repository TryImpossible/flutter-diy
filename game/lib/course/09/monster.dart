import 'package:flame/components.dart';

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
         anchor: Anchor.center,
       );

  final double life;

  @override
  Future<void> onLoad() async {
    initPaint(lifePoint: life);
    // add(RectangleHitbox()..debugMode = true);
  }

  @override
  void onDied() {
    removeFromParent();
  }

  void move(Vector2 ds) {
    position.add(ds);
  }
}
