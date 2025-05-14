import 'package:flame/components.dart';

class AdventurerComponent extends SpriteAnimationComponent with HasGameReference {
  final Function()? onLastFrame;
  final SpriteAnimation spriteAnimation;

  AdventurerComponent(
      {this.onLastFrame, required this.spriteAnimation, required Vector2 size})
      : super(
          size: size,
          anchor: Anchor.center,
          playing: false,
          animation: spriteAnimation,
        );

  @override
  Future<void> onLoad() async {
    animationTicker!.onComplete = _onLastFrame;
  }

  void shoot() {
    playing = true;
    animationTicker!.reset();
  }

  void flip({
    bool x = false,
    bool y = true,
  }) {
    scale = Vector2(scale.x * (y ? -1 : 1), scale.y * (x ? -1 : 1));
  }

  void _onLastFrame() async {
    animationTicker!.currentIndex = 0;
    animationTicker!.update(0);
    onLastFrame?.call();
  }
}
