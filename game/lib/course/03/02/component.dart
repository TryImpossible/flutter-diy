import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class AdventurerComponent extends SpriteAnimationComponent
    with HasGameReference, TapCallbacks, HoverCallbacks {
  late final RectangleHitbox _box;
  double _counter = 0;

  AdventurerComponent() : super(size: Vector2(50, 37), anchor: Anchor.center);

  @override
  Future<void>? onLoad() async {
    List<Sprite> sprites = [];
    for (int i = 0; i <= 8; i++) {
      sprites
          .add(await game.loadSprite('adventurer/adventurer-bow-0$i.png'));
    }
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.15);
    position = game.size / 2;
    _box = RectangleHitbox()..debugMode = false;
    add(_box);
  }

  @override
  bool onTapUp(TapUpEvent event) {
    _box.debugMode = true;
    return true;
  }

  @override
  bool onTapDown(TapDownEvent event) {
    _box.debugMode = true;
    _box.debugColor = Colors.red;
    _counter++;
    rotateTo(_counter * pi / 2);
    return true;
  }

  @override
  bool onTapCancel(TapCancelEvent event) {
    _box.debugMode = false;
    return true;
  }

  @override
  bool onHoverEnter() {
    _box.debugMode = true;
    _box.debugColor = Colors.greenAccent;
    return true;
  }

  @override
  bool onHoverExit() {
    _box.debugMode = false;
    return true;
  }

  void rotateTo(double deg) {
    angle = deg;
  }
}
