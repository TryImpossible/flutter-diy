import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/background.dart';
import 'components/hero.dart';

class OwnGame extends FlameGame
    with KeyboardEvents, ScrollDetector, ScaleDetector {
  static const zoomPerScrollUnit = 0.02;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final HeroMan hero = HeroMan();
    world.add(Background());
    world.add(hero);

    final Vector2 fixSize = Vector2(500, 300);
    camera.viewport = FixedResolutionViewport(resolution: fixSize);
    camera.viewfinder.anchor = Anchor.center;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    if (event.logicalKey == LogicalKeyboardKey.keyZ && isKeyDown) {
      camera.viewfinder.zoom += 0.1;
    }

    if (event.logicalKey == LogicalKeyboardKey.keyX && isKeyDown) {
      camera.viewfinder.zoom -= 0.1;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowRight && isKeyDown) {
      camera.moveTo(Vector2(0, size.y / 2 + 37 / 2));
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp && isKeyDown) {
      camera.moveTo(Vector2(0, size.y / 2 - 37 / 2));
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void onScroll(PointerScrollInfo info) {
    super.onScroll(info);
    camera.viewfinder.zoom +=
        info.scrollDelta.global.y.sign * zoomPerScrollUnit;
  }

  late double startZoom;

  @override
  void onScaleStart(ScaleStartInfo info) {
    super.onScaleStart(info);
    startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    super.onScaleUpdate(info);
    final Vector2 currentScale = info.scale.global;
    if (!currentScale.isIdentity()) {
      camera.viewfinder.zoom = startZoom * currentScale.y;
    } else {
      final double zoom = camera.viewfinder.zoom;
      final delta = (info.delta.global..negate()) / zoom;
      camera.moveBy(delta);
    }
  }
}
