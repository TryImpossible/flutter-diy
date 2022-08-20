import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game/course/06/damage_text.dart';

mixin Liveable on PositionComponent {
  final TextStyle _defaultTextStyle = const TextStyle(
    fontSize: 10,
    color: Colors.white,
  );
  late final TextComponent _text;

  final DamageText _damageText = DamageText();

  final Paint _outlinePaint = Paint();
  final Paint _fillPaint = Paint();

  /// 生命上限
  late double _lifePoint;

  /// 当前生命值
  late double _currentLife;

  final double offsetY = 10; // 血条距构件顶部偏移量
  final double widthRadio = 1.5; // 血条/构件宽度
  final double lifeBarHeight = 4; // 血条高度

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

    _text = TextComponent(textRenderer: TextPaint(style: _defaultTextStyle));
    _updateLifeText();
    double y = -(offsetY + _text.height + 2);
    double x = (size.x / 2) * (1 - widthRadio / 2);
    _text.position = Vector2(x, y);
    // _text.add(RectangleHitbox()..debugMode = true);
    add(_text);
    add(_damageText);
  }

  /// 当前生命百分比
  double get _progress => _currentLife / _lifePoint;

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

  final Random _random = Random();

  void loss(double point) {
    double crit = 0.75;
    double critDamage = 1.65;
    bool isCrit = _random.nextDouble() < crit;
    if (isCrit) {
      point = point * critDamage;
    }
    _damageText.addDamage(-point.toInt(), isCrit: isCrit);

    _currentLife -= point;
    _updateLifeText();
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

  void _updateLifeText() {
    _text.text = 'Hp ${_currentLife.toInt()}';
  }

  void onDied() {}
}
