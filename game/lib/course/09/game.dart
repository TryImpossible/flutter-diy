import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';

import 'adventurer.dart';
import 'bullet.dart';
import 'monster.dart';
import 'touch_indicator.dart';

class OwnGame extends FlameGame with KeyboardEvents, PanDetector {
  late final AdventurerComponent _player;
  late final MonsterComponent _monster;
  late final MonsterComponent _monster2;
  final double step = 10;

  final Random _random = Random();

  @override
  Future<void>? onLoad() async {
    _player = AdventurerComponent();
    add(_player);

    _monster = await _createMonster();
    add(_monster);

    _monster2 = await _createMonster2();
    add(_monster2);
  }

  Future<MonsterComponent> _createMonster() async {
    const String src = 'adventurer/animatronic.png';
    await images.load(src);
    final Image image = images.fromCache(src);
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
    return MonsterComponent(
      animation: animation,
      size: monsterSize,
      position: Vector2(pX, pY),
      life: 4000,
    );
  }

  Future<MonsterComponent> _createMonster2() async {
    const String src = 'adventurer/Characters-part-2.png';
    await images.load(src);
    final Image image = images.fromCache(src);

    SpriteSheet sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 9,
      rows: 6,
    );

    List<Sprite> sprites = sheet.getRowSprites(row: 0, start: 5, count: 4);
    SpriteAnimation animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 10,
      loop: true,
    );

    Vector2 monsterSize = Vector2(32, 48);
    final double pY = size.y / 4;
    final double pX = size.x - monsterSize.x / 2 - 200;

    return MonsterComponent(
      animation: animation,
      size: monsterSize,
      position: Vector2(pX, pY),
      life: 200,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    final Iterable<Bullet> bullets = children.whereType<Bullet>();
    for (Bullet bullet in bullets) {
      if (bullet.isRemoving) {
        continue;
      }
      if (_monster.containsPoint(bullet.absoluteCenter)) {
        bullet.removeFromParent();
        _monster.loss(50);
        break;
      }

      if (_monster2.containsPoint(bullet.absoluteCenter)) {
        bullet.removeFromParent();
        _monster2.loss(50);
        break;
      }
    }
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

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
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
