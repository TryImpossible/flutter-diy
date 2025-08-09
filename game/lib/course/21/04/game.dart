import 'dart:async';
import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/particles.dart';

import 'components/anim_bullet.dart';
import 'components/background.dart';
import 'components/player.dart';

class OwnGame extends FlameGame with TapDetector {
  late SpriteAnimation stoneBullet;
  late Player player;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final Background background = Background();
    add(background);

    player = Player();
    add(player);

    final List<Sprite> sprites = <Sprite>[];
    for (int i = 1; i <= 4; i++) {
      sprites.add(await loadSprite('adventurer/skill01/ef0$i.png'));
    }
    stoneBullet = SpriteAnimation.spriteList(sprites, stepTime: 0.1);
  }

  @override
  void onTap() {
    addBullet();
  }

  void addBullet() {
    AnimBullet bullet = AnimBullet(
      animation: stoneBullet,
      maxRange: 200,
      speed: 200,
    );
    bullet.size = Vector2(470 / 15, 258 / 15);
    bullet.angle = pi;
    bullet.anchor = Anchor.center;
    bullet.priority = 1;
    priority = 2;
    bullet.position = player.position + Vector2(60, 15);
    add(bullet);
  }
}
