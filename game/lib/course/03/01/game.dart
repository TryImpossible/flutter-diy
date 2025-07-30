import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'component.dart';

class OwnGame extends FlameGame with KeyboardEvents, TapDetector, PanDetector {
  late final AdventurerComponent _player;
  late final RectangleHitbox _box;

  @override
  Future<void>? onLoad() async {
    _player = AdventurerComponent();
    _box = RectangleHitbox()..debugMode = false;
    await _player.add(_box);
    await add(_player);
  }

  double _counter = 0;

  @override
  void onTap() {
    _counter++;
    _player.rotateTo(_counter * pi / 2);
  }

  @override
  void onTapCancel() {
    _box.debugMode = false;
  }

  @override
  void onTapDown(TapDownInfo info) {
    _box.debugMode = true;
  }

  @override
  void onPanStart(DragStartInfo info) {
    super.onPanStart(info);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    _player.move(info.delta.global);
  }

  @override
  void onTapUp(TapUpInfo info) {
    _box.debugMode = false;
  }

  final double _step = 10;

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    print(event.runtimeType);
    final bool isKeyDown = event is KeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.keyY && isKeyDown) {
      _player.flip(y: true);
    }
    if (event.logicalKey == LogicalKeyboardKey.keyX && isKeyDown) {
      _player.flip(x: true);
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
        event.logicalKey == LogicalKeyboardKey.keyW && isKeyDown) {
      _player.move(Vector2(0, -_step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
        event.logicalKey == LogicalKeyboardKey.keyS && isKeyDown) {
      _player.move(Vector2(0, _step));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
        event.logicalKey == LogicalKeyboardKey.keyA && isKeyDown) {
      _player.move(Vector2(-_step, 0));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
        event.logicalKey == LogicalKeyboardKey.keyD && isKeyDown) {
      _player.move(Vector2(_step, 0));
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
