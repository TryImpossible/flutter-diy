import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'adventurer.dart';
import 'bullet.dart';
import 'monster.dart';
import 'touch_indicator.dart';

class OwnGame extends FlameGame with KeyboardEvents, PanDetector {
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
      animation: animation,
      size: monsterSize,
      position: Vector2(pX, pY),
    );
    add(_player);
    add(_monster);
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
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;
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
