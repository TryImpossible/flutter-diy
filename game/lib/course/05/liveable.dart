import 'package:flame/components.dart';
import 'package:flutter/material.dart';

mixin Liveable on PositionComponent {
  final Paint _outlinePaint = Paint();
  final Paint _fillPaint = Paint();

  /// 生命上限
  late double _lifePoint;

  /// 当前生命值
  late double _currentLife;

  void initPaint({
    required double lifePoint,
    Color lifeColor = Colors.red,
    Color outlineColor = Colors.white,
  }) {
    _outlinePaint
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    _fillPaint.color = lifeColor;
    _lifePoint = lifePoint;
    _currentLife = lifePoint;
  }

  /// 当前生命百分比
  double get _progress => _currentLife / _lifePoint;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final double offsetY = 10; // 血条距构件顶部偏移量
    final double widthRadio = 1.5; // 血条/构件宽度
    final double lifeBarHeight = 4; // 血条高度

    final Rect rect = Rect.fromCenter(
      center: Offset(size.x / 2, lifeBarHeight / 2 - offsetY),
      width: size.x / 2 * widthRadio,
      height: lifeBarHeight,
    );
    Rect lifeRect = Rect.fromPoints(
      rect.topLeft + Offset(rect.width * (1 - _progress), 0),
      rect.bottomRight,
    );
    canvas.drawRect(lifeRect, _fillPaint);
    canvas.drawRect(rect, _outlinePaint);
  }

  void loss(double point) {
    _currentLife -= point;
    if (_currentLife <= 0) {
      _currentLife = 0;
      onDied();
    }
  }

  void cure(double point) {
    _currentLife += point;
    if (_currentLife > _lifePoint) {
      _currentLife = _lifePoint;
    }
  }

  void onDied() {}
}
