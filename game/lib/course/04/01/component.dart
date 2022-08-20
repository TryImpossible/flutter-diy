import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class AdventurerComponent extends SpriteAnimationComponent with HasGameRef {
  AdventurerComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = <Sprite>[];
    for (int i = 0; i <= 8; i++) {
      sprites
          .add(await gameRef.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15, loop: true);
    animation!.onComplete = _onLastFrame;
    position = gameRef.size / 2;
  }

  void shoot() {
    animation!.reset();
  }

  void flip({bool x = false, bool y = true}) {
    scale = Vector2(scale.x * (y ? -1 : 1), scale.y * (x ? -1 : 1));
  }

  void move(Vector2 ds) {
    position.add(ds);
  }

  void rotate(double deg) {
    angle = deg;
  }

  void _onLastFrame() {
    animation!.currentIndex = 0;
    animation!.update(0);
  }
}

class MonsterComponent extends SpriteComponent {
  MonsterComponent({
    required Sprite sprite,
    required Vector2 size,
    required Vector2 position,
  }) : super(
          sprite: sprite,
          size: size,
          position: position,
          anchor: Anchor.center,
        );

  @override
  Future<void>? onLoad() async {
    add(RectangleHitbox()..debugMode = true);
  }
}
