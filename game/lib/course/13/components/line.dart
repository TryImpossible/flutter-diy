import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Line extends PositionComponent with CollisionCallbacks {
  Line({required this.lineWidth, required Vector2 position})
    : super(
        position: position,
        size: Vector2(lineWidth, 2),
        anchor: Anchor.center,
      );
  final double lineWidth;

  final Paint _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawLine(Offset.zero, Offset(width, 0), _paint);
  }

  late ShapeHitbox hitbox;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    hitbox = RectangleHitbox();
    // hitbox.debugMode = true;
    add(hitbox);
  }

  final Color _collisionColor = Colors.amber;

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    _paint.color = _collisionColor;
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _paint.color = Colors.white;
  }
}
