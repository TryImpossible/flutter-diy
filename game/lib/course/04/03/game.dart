import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide Image;

import 'component.dart';

class OwnGame extends FlameGame with KeyboardEvents {
  late final AdventurerComponent _player;
  late final MonsterComponent _monster;
  final double step = 10;

  final Random _random = Random();

  @override
  Future<void>? onLoad() async {
    _player = AdventurerComponent();
    add(_player);

    const String src = 'adventurer/Characters-part-2.png';
    final Image image = await images.load(src);

    final SpriteSheet sheet =
        SpriteSheet.fromColumnsAndRows(image: image, columns: 9, rows: 6);
    final List<Sprite> sprites = sheet.getRowSprites(
      row: 0,
      start: 5,
      count: 4,
    );
    final SpriteAnimation animation =
        SpriteAnimation.spriteList(sprites, stepTime: 1 / 10, loop: true);

    final Vector2 monsterSize = Vector2(32, 48);
    final double pY = _random.nextDouble() * size.y;
    final double pX = size.x - monsterSize.x / 2;
    _monster = MonsterComponent(
      animation: animation,
      size: monsterSize,
      position: Vector2(pX, pY),
    );
    add(_monster);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.keyY && isKeyDown) {
      _player.flip(y: true);
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX && isKeyDown) {
      _player.flip(x: true);
    }

    if (event.logicalKey == LogicalKeyboardKey.keyJ && isKeyDown) {
      _player.shoot();
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
        event.logicalKey == LogicalKeyboardKey.keyW && isKeyDown) {
      _player.move(Vector2(0, -step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
        event.logicalKey == LogicalKeyboardKey.keyS && isKeyDown) {
      _player.move(Vector2(0, step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.keyA && isKeyDown) {
      _player.move(Vector2(-step, 0));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
        event.logicalKey == LogicalKeyboardKey.keyD && isKeyDown) {
      _player.move(Vector2(step, 0));
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
