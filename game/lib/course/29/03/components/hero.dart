import 'dart:async';

import 'package:flame/components.dart';

class HeroMan extends SpriteComponent {
  HeroMan() : super(size: Vector2(50, 37), anchor: Anchor.center);
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load('adventurer/adventurer-bow-00.png');
  }
}
