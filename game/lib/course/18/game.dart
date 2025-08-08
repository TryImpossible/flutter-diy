import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/course/18/components/text_info_component.dart';

import 'components/adventurer.dart';

class OwnGame extends FlameGame with KeyboardEvents {
  late Adventurer player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    player = Adventurer();
    player.add(RectangleHitbox()..debugMode = true);
    add(player);

    Component textInfo = TextInfoComponent(position: Vector2(10, 30));
    add(textInfo);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    if (event.logicalKey == LogicalKeyboardKey.digit1 && isKeyDown) {
      addMoveByEffect();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit2 && isKeyDown) {
      addMoveToEffect();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit3 && isKeyDown) {
      addRotateEffectBy();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit4 && isKeyDown) {
      addRotateEffectTo();
    }

    if (event.logicalKey == LogicalKeyboardKey.digit5 && isKeyDown) {
      addScaleEffectBy();
    }
    if (event.logicalKey == LogicalKeyboardKey.digit6 && isKeyDown) {
      addScaleEffectTo();
    }

    if (event.logicalKey == LogicalKeyboardKey.digit7 && isKeyDown) {
      addRemoveEffect();
    }

    if (event.logicalKey == LogicalKeyboardKey.digit8 && isKeyDown) {
      addSizeEffectBy();
    }

    if (event.logicalKey == LogicalKeyboardKey.digit9 && isKeyDown) {
      addSizeEffectTo();
    }

    if (event.logicalKey == LogicalKeyboardKey.keyQ && isKeyDown) {
      addOpacityEffectBy();
    }

    if (event.logicalKey == LogicalKeyboardKey.keyW && isKeyDown) {
      addOpacityEffectTo();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyE && isKeyDown) {
      addColorEffect();
    }
    if (event.logicalKey == LogicalKeyboardKey.keyR && isKeyDown) {
      addMoveAlongPathEffect();
    }

    return super.onKeyEvent(event, keysPressed);
  }

  /// 1
  void addMoveByEffect() {
    Effect effect = MoveByEffect(
      Vector2(10, -10),
      EffectController(duration: 0.5),
    );
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

  /// 8
  void addSizeEffectBy() {
    Effect effect = SizeEffect.by(
      Vector2(5, 5 * (37 / 50)),
      EffectController(duration: 0.5),
    );
    player.add(effect);
  }

  /// 9
  void addSizeEffectTo() {
    Effect effect = SizeEffect.to(
      Vector2(50, 37),
      EffectController(duration: 0.5),
    );
    player.add(effect);
  }

  /// q
  void addOpacityEffectBy() {
    Effect effect = OpacityEffect.by(-0.1, EffectController(duration: 0.5));
    player.add(effect);
  }

  /// w
  void addOpacityEffectTo() {
    Effect effect = OpacityEffect.to(1, EffectController(duration: 0.5));
    player.add(effect);
  }

  /// e
  void addColorEffect() {
    Effect effect = ColorEffect(Colors.blue, EffectController(duration: 0.5));
    player.add(effect);
  }

  Path path = Path()..quadraticBezierTo(50, -50, 100, 0);
  int curveMoveCount = 0;

  /// r
  void addMoveAlongPathEffect() {
    Effect effect = MoveAlongPathEffect(path, EffectController(duration: 0.5));
    effect.onComplete = () {
      curveMoveCount++;
    };
    player.add(effect);
  }
}
