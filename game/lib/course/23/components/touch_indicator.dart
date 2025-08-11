import 'dart:async';

import 'package:flame/components.dart';

import '../gen/assets.gen.dart';

class TouchIndicator extends SpriteAnimationComponent {
  TouchIndicator({required Vector2 postion})
    : super(size: Vector2(30, 30), position: postion, anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    List<Sprite> sprites = <Sprite>[];
    for (var i = 1; i <= 10; i++) {
      final String src = Assets.images.touch.star01.keyName.replaceFirst(
        RegExp('star_01'),
        'star_${'$i'.padLeft(2, '0')}',
      );
      sprites.add(await Sprite.load(src));
    }
    removeOnFinish = true;
    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 15,
      loop: false,
    );
  }
}
