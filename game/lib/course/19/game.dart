import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/adventurer.dart';
import 'components/text_info_component.dart';

class OwnGame extends FlameGame with KeyboardEvents {
  late Adventurer player;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Adventurer();
    player.add(RectangleHitbox()..debugMode = true);
    add(player);

    TextInfoComponent textInfo = TextInfoComponent(position: Vector2(10, 30));
    add(textInfo);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final bool isKeyDown = event is KeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.digit0 && isKeyDown) {
      resetPosition();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit1 && isKeyDown) {
      linearEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit2 && isKeyDown) {
      curvedEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit3 && isKeyDown) {
      reverseLinearEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit4 && isKeyDown) {
      reverseCurvedEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit5 && isKeyDown) {
      sineEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit6 && isKeyDown) {
      zigzagEffectController();
    }

    return super.onKeyEvent(event, keysPressed);
  }

  /// 0
  void resetPosition() {
    Effect effect = MoveToEffect(size / 2, EffectController(duration: 0.5));
    player.add(effect);
  }

  /// 1
  void linearEffectController() {
    EffectController controller = LinearEffectController(2);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 2
  void curvedEffectController() {
    EffectController controller = CurvedEffectController(2, Curves.ease);
    Effect effect = MoveEffect.by(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 3
  void reverseLinearEffectController() {
    EffectController controller = ReverseLinearEffectController(2);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 4
  void reverseCurvedEffectController() {
    EffectController controller = ReverseCurvedEffectController(2, Curves.ease);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 5
  void sineEffectController() {
    EffectController controller = SineEffectController(period: 2);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 6
  void zigzagEffectController() {
    EffectController controller = ZigzagEffectController(period: 2);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }
}
