import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class HeroComponent extends SpriteAnimationComponent
    with HasGameRef, Tappable, Hoverable {
  late final RectangleHitbox _box;
  double _counter = 0;

  HeroComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = [];
    for (int i = 0; i <= 8; i++) {
      sprites
          .add(await gameRef.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15);
    position = gameRef.size / 2;
    _box = RectangleHitbox()..debugMode = false;
    add(_box);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    _box.debugMode = true;
    return true;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    _box.debugMode = true;
    _box.debugColor = Colors.red;
    _counter++;
    rotateTo(_counter * pi / 2);
    return true;
  }

  @override
  bool onTapCancel() {
    _box.debugMode = false;
    return true;
  }

  @override
  bool onHoverEnter(PointerHoverInfo info) {
    _box.debugMode = true;
    _box.debugColor = Colors.greenAccent;
    return true;
  }

  @override
  bool onHoverLeave(PointerHoverInfo info) {
    _box.debugMode = false;
    return true;
  }

  void rotateTo(double deg) {
    angle = deg;
  }
}
