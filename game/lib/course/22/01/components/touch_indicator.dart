import 'dart:async';

import 'package:flame/components.dart';

class TouchIndicator extends SpriteAnimationComponent {
  TouchIndicator({required Vector2 postion})
    : super(size: Vector2(30, 30), position: postion, anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    List<Sprite> sprites = <Sprite>[];
    for (var i = 1; i <= 10; i++) {
      sprites.add(await Sprite.load('touch/star_${'$i'.padLeft(2, '0')}.png'));
    }
    removeOnFinish = true;
    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 15,
      loop: false,
    );
  }
}
