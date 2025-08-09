import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TextInfoComponent extends PositionComponent {
  TextInfoComponent({required Vector2 position}) : super(position: position);

  final TextStyle _style = TextStyle(
    fontSize: 12,
    color: Colors.white,
    shadows: [Shadow(color: Colors.red, offset: Offset(1, 1), blurRadius: 1)],
  );

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    TextComponent textInfo = TextComponent(
      textRenderer: TextPaint(style: _style),
    );
    textInfo.text =
        '0 重置位置\n'
        '1 线性控制器 LinearEffectController\n'
        '2 曲线控制器 CurvedEffectController\n'
        '3 反向线性控制器 ReverseLinearEffectController\n'
        '4 反向曲线控制器 ReverseCurvedEffectController\n'
        '5 sin 曲线控制器 SineEffectController\n'
        '6 锯齿曲线控制器 ZigzagEffectController\n'
        '7 延时特效控制器 DelayedEffectController\n'
        '8 重复特效控制器 RepeatedEffectController\n'
        'q 无限特效控制器 InfiniteEffectController\n'
        'w 随机时长控制器 RandomEffectController\n'
        'e 速度控制器 SpeedEffectController\n'
        'r 序列控制器 SequenceEffectController\n';
    add(textInfo);
  }
}
