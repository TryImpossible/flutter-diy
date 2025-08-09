import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';

import '../game.dart';

class Player extends SpriteAnimationComponent with HasGameReference<OwnGame> {
  Player() : super(size: Vector2(320, 160), anchor: Anchor.center);
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    const String src = 'parallax/airplane.png';
    await game.images.load(src);
    var image = game.images.fromCache(src);
    SpriteSheet sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 4,
      rows: 1,
    );

    List<Sprite> sprites = sheet.getSprites();
    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 10,
      loop: true,
    );
    position = game.size / 2;
  }
}
