import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/course/02/game.dart';

class AdventurerComponent extends SpriteAnimationComponent
    with HasGameReference<OwnGame> {
  AdventurerComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = [];
    for (int i = 0; i <= 8; i++) {
      sprites.add(await game.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15);
    position = game.size / 2;
    add(RectangleHitbox()..debugMode = true);
  }

  // Pixels/ 秒
  double get speed => 200.0;

  void move(Vector2 ds) {
    position.add(ds);
  }

  void rotateTo(double deg) {
    angle = deg;
  }
}
