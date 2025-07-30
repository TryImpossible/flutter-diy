import 'package:flame/components.dart';

import 'liveable.dart';

class MonsterComponent extends SpriteAnimationComponent with Liveable {
  MonsterComponent({
    required SpriteAnimation animation,
    required Vector2 size,
    required Vector2 position,
  }) : super(
         animation: animation,
         size: size,
         position: position,
         anchor: Anchor.center,
       );

  @override
  Future<void> onLoad() async {
    initPaint(lifePoint: 400);
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
