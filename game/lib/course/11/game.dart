import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';

import 'bullet.dart';
import 'hero.dart';
import 'monster.dart';
import 'touch_indicator.dart';

class OwnGame extends FlameGame with KeyboardEvents, PanDetector {
  late final HeroComponent _hero;
  late final HeroComponent _hero1;
  late final MonsterComponent _monster;
  late final MonsterComponent _monster2;
  late final MonsterComponent _monster3;
  final double step = 10;

  final Random _random = Random();

  @override
  Future<void>? onLoad() async {
    addHero();
    addHero2();

    _monster = await _createMonster();
    add(_monster);

    Vector2 monsterSize = Vector2(64, 64);
    _monster2 = await _createMonster2(
        Vector2(size.x - monsterSize.x / 2 - 200, size.y / 4));
    add(_monster2);
    _monster3 =
        await _createMonster2(Vector2(monsterSize.x / 2 + 50, size.y / 4));
    add(_monster3);
  }

  Future<void> addHero() async {
    List<Sprite> sprites = [];
    for (int i = 0; i <= 8; i++) {
      sprites.add(await loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    SpriteAnimation animation =
        SpriteAnimation.spriteList(sprites, stepTime: 0.1, loop: false);

    final HeroAttr heroAttr = HeroAttr(
      life: 3000,
      speed: 100,
      attackSpeed: 200,
      attackRange: 200,
      attack: 50,
      crit: 0.75,
      critDamage: 1.5,
    );

    _hero = HeroComponent(
      initPosition: size / 2,
      attr: heroAttr,
      spriteAnimation: animation,
      size: Vector2(50, 37),
    );

    add(_hero);
  }

  Future<void> addHero2() async {
    const String src = 'adventurer/Characters-part-2.png';
    await images.load(src);
    var image = images.fromCache(src);

    SpriteSheet sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 9,
      rows: 6,
    );

    List<Sprite> sprites = sheet.getRowSprites(row: 0, start: 0, count: 5);
    SpriteAnimation animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 1 / 10,
      loop: true,
    );

    final HeroAttr heroAttr = HeroAttr(
      life: 2000,
      speed: 100,
      attackSpeed: 200,
      attackRange: 200,
      attack: 100,
      crit: 0.75,
      critDamage: 1.5,
    );

    _hero1 = HeroComponent(
      initPosition: size / 2 - Vector2(100, 0),
      attr: heroAttr,
      spriteAnimation: animation,
      size: Vector2(32, 48),
    );

    add(_hero1);
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

  Future<MonsterComponent> _createMonster2(Vector2 position) async {
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

    return MonsterComponent(
      animation: animation,
      size: monsterSize,
      position: position,
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
        _monster.loss(_hero.attr);
        break;
      }

      if (_monster2.containsPoint(bullet.absoluteCenter)) {
        bullet.removeFromParent();
        _monster2.loss(_hero.attr);
        break;
      }

      if (_monster3.containsPoint(bullet.absoluteCenter)) {
        bullet.removeFromParent();
        _monster3.loss(_hero.attr);
        break;
      }
    }
  }

  @override
  void onPanEnd(DragEndInfo info) {
    if (_lastPointerPos != null) {
      _hero.toTarget(_lastPointerPos!);
      _lastPointerPos = null;
    }
  }

  @override
  void onPanStart(DragStartInfo info) {}

  @override
  void onPanDown(DragDownInfo info) {
    Vector2 target = info.eventPosition.global;
    _lastPointerPos = null;
    add(TouchIndicator(position: target));
    _hero.toTarget(target);
  }

  double ds = 0;
  Vector2? _lastPointerPos;

  @override
  void onPanUpdate(DragUpdateInfo info) {
    ds += info.delta.global.length;
    if (ds > 10) {
      _lastPointerPos = info.eventPosition.global;
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
      _hero.flip(y: true);
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX && isKeyDown) {
      _hero.flip(x: true);
    }

    if (event.logicalKey == LogicalKeyboardKey.keyJ && isKeyDown) {
      _hero.shoot();
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
        event.logicalKey == LogicalKeyboardKey.keyW && isKeyDown) {
      _hero.move(Vector2(0, -step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
        event.logicalKey == LogicalKeyboardKey.keyS && isKeyDown) {
      _hero.move(Vector2(0, step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.keyA && isKeyDown) {
      _hero.move(Vector2(-step, 0));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
        event.logicalKey == LogicalKeyboardKey.keyD && isKeyDown) {
      _hero.move(Vector2(step, 0));
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
