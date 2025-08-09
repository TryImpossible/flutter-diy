import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart' hide Hero, Image;
import 'package:flutter/services.dart';
import 'components/hero.dart';
import 'components/monster_manager.dart';
import 'components/touch_indicator.dart';
import 'menu/pause.dart';

class OwnGame extends FlameGame
    with HasCollisionDetection, KeyboardEvents, PanDetector {
  late final Hero player;
  final double step = 10;

  late MonsterManager monsterManager;

  @override
  FutureOr<void> onLoad() async {
    await Future.wait([addPlayer(), addMonster()]);
  }

  Future<void> addPlayer() async {
    List<Sprite> sprites = [];
    for (int i = 0; i <= 8; i++) {
      sprites.add(await loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    SpriteAnimation animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.1,
      loop: false,
    );
    Sprite bulletSprite = await loadSprite('adventurer/weapon_arrow.png');
    SpriteAnimation bulletAnimation = SpriteAnimation.spriteList(
      [bulletSprite],
      stepTime: 0.1,
      loop: false,
    );

    final HeroAttr attr = HeroAttr(
      life: 3000,
      speed: 100,
      attackSpeed: 200,
      attackRange: 200,
      attack: 50,
      crit: 0.75,
      critDamage: 1.5,
    );
    player = Hero(
      attr: attr,
      animation: animation,
      bulletAnimation: bulletAnimation,
      position: size / 2,
      size: Vector2(50, 37),
    );
    add(player);
  }

  Future<void> addMonster() async {
    const String src = 'adventurer/animatronic.png';
    await images.load(src);
    final Image image = images.fromCache(src);
    final SpriteSheet bossSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 13,
      rows: 6,
    );

    final List<Sprite> bossBulletSprites = <Sprite>[];
    for (var i = 0; i <= 28; i++) {
      bossBulletSprites.add(await loadSprite('adventurer/skill02/s$i.png'));
    }
    final SpriteAnimation bossBulletAnimation = SpriteAnimation.spriteList(
      bossBulletSprites,
      stepTime: 0.1,
    );

    const String src2 = 'adventurer/Characters-part-2.png';
    await images.load(src2);
    final Image image2 = images.fromCache(src2);
    final SpriteSheet stoneSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: image2,
      columns: 9,
      rows: 6,
    );

    final List<Sprite> stoneBulletSprites = <Sprite>[];
    for (var i = 1; i <= 4; i++) {
      stoneBulletSprites.add(
        await loadSprite(
          'adventurer/skill01/ef${i.toString().padLeft(2, '0')}.png',
        ),
      );
    }
    final SpriteAnimation stoneBulletAnimation = SpriteAnimation.spriteList(
      stoneBulletSprites,
      stepTime: 0.1,
    );

    monsterManager = MonsterManager(
      bossSpriteSheet: bossSpriteSheet,
      bossBulletSpriteAnimation: bossBulletAnimation,
      stoneSpriteSheet: stoneSpriteSheet,
      stoneBulletSpriteAnimation: stoneBulletAnimation,
    );
    add(monsterManager);
  }

  @override
  void onPanStart(DragStartInfo info) {
    super.onPanStart(info);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    super.onPanEnd(info);
    if (_lastPoinerPos != null) {
      player.toTarget(_lastPoinerPos!);
      _lastPoinerPos = null;
    }
  }

  @override
  void onPanDown(DragDownInfo info) {
    super.onPanDown(info);
    _lastPoinerPos = null;

    Vector2 target = info.eventPosition.global;
    add(TouchIndicator(postion: target));
    player.toTarget(target);
  }

  double ds = 0;
  Vector2? _lastPoinerPos;

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);
    ds += info.delta.global.length;
    if (ds > 10) {
      ds = 0;
      add(TouchIndicator(postion: info.eventPosition.global));
      _lastPoinerPos = info.eventPosition.global;
    }
  }

  void toggleGameState() {
    if (paused) {
      resumeEngine();
      overlays.remove(PauseMenu.menuId);
    } else {
      pauseEngine();
      overlays.add(PauseMenu.menuId);
    }
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.keyJ && isKeyDown) {
      player.shoot();
    }
    if (event.logicalKey == LogicalKeyboardKey.space && isKeyDown) {
      toggleGameState();
    }
    if ((event.logicalKey == LogicalKeyboardKey.arrowUp ||
            event.logicalKey == LogicalKeyboardKey.keyW) &&
        isKeyDown) {
      player.move(Vector2(0, -step));
    }
    if ((event.logicalKey == LogicalKeyboardKey.arrowDown ||
            event.logicalKey == LogicalKeyboardKey.keyS) &&
        isKeyDown) {
      player.move(Vector2(0, step));
    }
    if ((event.logicalKey == LogicalKeyboardKey.arrowLeft ||
            event.logicalKey == LogicalKeyboardKey.keyA) &&
        isKeyDown) {
      player.move(Vector2(-step, 0));
      if (player.isLeft) {
        player.flip();
      }
    }
    if ((event.logicalKey == LogicalKeyboardKey.arrowRight ||
            event.logicalKey == LogicalKeyboardKey.keyD) &&
        isKeyDown) {
      player.move(Vector2(step, 0));
      if (!player.isLeft) {
        player.flip();
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
