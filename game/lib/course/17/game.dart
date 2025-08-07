import 'dart:async';
import 'dart:math';

import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/adventurer.dart';

class OwnGame extends FlameGame with KeyboardEvents {
  late final Adventurer player;
  final double step = 10;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Adventurer();
    add(player);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final bool isKeyDown = event is KeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.digit1 && isKeyDown) {
      addMoveByEffect();
    } else if (event.logicalKey == LogicalKeyboardKey.digit2 && isKeyDown) {
      addMoveToEffect();
    } else if (event.logicalKey == LogicalKeyboardKey.digit3 && isKeyDown) {
      addRotateEffectBy();
    } else if (event.logicalKey == LogicalKeyboardKey.digit4 && isKeyDown) {
      addRotateEffectTo();
    } else if (event.logicalKey == LogicalKeyboardKey.digit5 && isKeyDown) {
      addScaleEffectBy();
    } else if (event.logicalKey == LogicalKeyboardKey.digit6 && isKeyDown) {
      addScaleEffectTo();
    } else if (event.logicalKey == LogicalKeyboardKey.digit7 && isKeyDown) {
      addRemoveEffect();
    }
    return super.onKeyEvent(event, keysPressed);
  }

  /// 1
  void addMoveByEffect() {
    Effect effect = MoveByEffect(
      Vector2(10, -10),
      EffectController(duration: 0.5),
    );
    effect.onComplete = () {
      print('===onComplet===');
    };
    player.add(effect);
  }

  /// 2
  void addMoveToEffect() {
    Effect effect = MoveToEffect(size / 2, EffectController(duration: 0.5));
    player.add(effect);
  }

  /// 3
  void addRotateEffectBy() {
    Effect effect = RotateEffect.by(
      15 / 180 * pi,
      EffectController(duration: 0.5),
    );
    player.add(effect);
  }

  /// 4
  void addRotateEffectTo() {
    Effect effect = RotateEffect.to(0, EffectController(duration: 0.5));
    player.add(effect);
  }

  /// 5
  void addScaleEffectBy() {
    Effect effect = ScaleEffect.by(
      Vector2(1.2, 1.2),
      EffectController(duration: 0.5),
    );
    player.add(effect);
  }

  /// 6
  void addScaleEffectTo() {
    Effect effect = ScaleEffect.to(
      Vector2(1, 1),
      EffectController(duration: 0.5),
    );
    player.add(effect);
  }

  /// 7
  void addRemoveEffect() {
    Effect effect = RemoveEffect(delay: 3);
    player.add(effect);
  }
}
