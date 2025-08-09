import 'dart:async';

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
    // player.add(RectangleHitbox()..debugMode = true);
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
    if (event.logicalKey == LogicalKeyboardKey.digit7 && isKeyDown) {
      delayedEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit8 && isKeyDown) {
      repeatedEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyQ && isKeyDown) {
      infiniteEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyW && isKeyDown) {
      randomEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyE && isKeyDown) {
      speedEffectController();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyR && isKeyDown) {
      sequenceEffectController();
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
    print('123');
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

  /// 7
  void delayedEffectController() {
    EffectController child = CurvedEffectController(2, Curves.ease);
    EffectController controller = DelayedEffectController(child, delay: 2);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// 8
  void repeatedEffectController() {
    EffectController child = SineEffectController(period: 0.1);
    EffectController controller = RepeatedEffectController(child, 5);
    Effect effect = MoveByEffect(Vector2(-2, 0), controller);
    player.add(effect);
  }

  /// q
  void infiniteEffectController() {
    EffectController child = SineEffectController(period: 0.1);
    EffectController controller = InfiniteEffectController(child);
    Effect effect = MoveByEffect(Vector2(-2, 0), controller);
    player.add(effect);
  }

  /// w
  void randomEffectController() {
    DurationEffectController child = LinearEffectController(2);
    EffectController controller = RandomEffectController.uniform(
      child,
      min: 1,
      max: 3,
    );
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// e
  void speedEffectController() {
    DurationEffectController child = LinearEffectController(2);
    EffectController controller = SpeedEffectController(child, speed: 10);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }

  /// r
  void sequenceEffectController() {
    EffectController child1 = LinearEffectController(2);
    EffectController child2 = ZigzagEffectController(period: 2);
    EffectController child3 = CurvedEffectController(2, Curves.ease);
    EffectController controller = SequenceEffectController([
      child1,
      child2,
      child3,
    ]);
    Effect effect = MoveByEffect(Vector2(0, -100), controller);
    player.add(effect);
  }
}
