import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Polygon extends PositionComponent with CollisionCallbacks {
  Polygon({required this.radius, required Vector2 position})
    : super(
        position: position,
        size: Vector2(radius * 2, radius * 2),
        anchor: Anchor.center,
      );

  final double radius;

  final Paint _paint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final List<Offset> points = [
      Offset(size.x, size.y / 2),
      Offset(size.x / 2, size.y),
      Offset(0, size.y / 2),
      Offset(size.x / 2, 0),
      Offset(size.x, size.y / 2),
    ];
    canvas.drawPoints(PointMode.polygon, points, _paint);
  }

  late ShapeHitbox hitbox;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    hitbox = PolygonHitbox([
      Vector2(size.x, size.y / 2),
      Vector2(size.x / 2, size.y),
      Vector2(0, size.y / 2),
      Vector2(size.x / 2, 0),
    ]);
    // hitbox.debugMode = true;
    add(hitbox);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    _paint.color = Colors.blue;
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    _paint.color = Colors.white;
  }
}
