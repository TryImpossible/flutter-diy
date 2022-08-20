import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';

import 'adventurer.dart';
import 'monster.dart';
import 'touch_indicator.dart';

class OwnGame extends FlameGame with TapDetector, PanDetector {
  late final AdventurerComponent _player;
  late final MonsterComponent _monster;
  final double step = 10;

  final Random _random = Random();

  @override
  Future<void>? onLoad() async {
    _player = AdventurerComponent();
    const String src = 'adventurer/animatronic.png';
    await images.load(src);
    var image = images.fromCache(src);

    SpriteSheet sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 13,
      rows: 6,
    );

    SpriteAnimation animation = SpriteAnimation.spriteList(
      sheet.getSprites(),
      stepTime: 1 / 24,
      loop: true,
    );

    Vector2 monsterSize = Vector2(64, 64);
    final double pY = _random.nextDouble() * size.y;
    final double pX = size.x - monsterSize.x / 2;
    _monster = MonsterComponent(
        animation: animation, size: monsterSize, position: Vector2(pX, pY));
    add(_player);
    add(_monster);
  }

  @override
  void onTap() {
    super.onTap();
    _monster.loss(50);
  }

  @override
  void onPanDown(DragDownInfo info) {
    Vector2 target = info.eventPosition.global;
    add(TouchIndicator(position: target));
    _player.toTarget(target);
  }

  double ds = 0;

  @override
  void onPanUpdate(DragUpdateInfo info) {
    ds += info.delta.global.length;
    if (ds > 10) {
      add(TouchIndicator(position: info.eventPosition.global));
      ds = 0;
    }
  }
}
