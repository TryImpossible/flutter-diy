import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game/course/04/03/game.dart';

class AdventurerComponent extends SpriteAnimationComponent
    with HasGameReference<OwnGame> {
  AdventurerComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = <Sprite>[];
    for (int i = 0; i <= 8; i++) {
      sprites.add(await game.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15, loop: true);
    animationTicker!.onComplete = _onLastFrame;
    position = game.size / 2;
  }

  void shoot() {
    animationTicker!.reset();
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
    animationTicker!.currentIndex = 0;
    animationTicker!.update(0);
  }
}

class MonsterComponent extends SpriteAnimationComponent {
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
  Future<void>? onLoad() async {
    add(RectangleHitbox()..debugMode = true);
  }
}
