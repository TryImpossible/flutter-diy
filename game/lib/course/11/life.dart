import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game/course/06/damage_text.dart';

class LifeComponent extends PositionComponent {
  LifeComponent({
    required this.lifePoint,
    this.outlineColor = Colors.white,
    this.lifeColor = Colors.red,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size, anchor: Anchor.center);

  double lifePoint; // 生命上限
  Color outlineColor;
  Color lifeColor;

  final Paint _outlinePaint = Paint();
  final Paint _fillPaint = Paint();
  late double _currentLife; // 当前生命值

  late final TextComponent _text;
  final double offsetY = 10; // 血条距构件顶部偏移量
  final double widthRadio = 1.5; // 血条/构件宽度
  final double lifeBarHeight = 4; // 血条高度

  final TextStyle _defaultTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.white,
  );
  final DamageText _damageText = DamageText();

  // 当前血条百分百
  double get _progress => _currentLife / lifePoint;

  @override
  FutureOr<void> onLoad() {
    _outlinePaint
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    _fillPaint.color = lifeColor;

    _currentLife = lifePoint;

    _text = TextComponent(textRenderer: TextPaint(style: _defaultTextStyle));
    _updateLifeText();
    double y = -(offsetY + _text.height + 2);
    double x = (size.x / 2) * (1 - widthRadio / 2);
    _text.position = Vector2(x, y);
    add(_text);
    add(_damageText);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
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

  void cure(double point) {
    _currentLife += point;
    _updateLifeText();
    if (_currentLife >= lifePoint) {
      _currentLife = lifePoint;
    }
  }

  void _updateLifeText() {
    _text.text = 'Hp ${_currentLife.toInt()}';
  }
}
