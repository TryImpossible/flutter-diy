import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';

import 'component.dart';

class OwnGame extends FlameGame with HasDraggables {
  late final JoystickComponent _moveJoystick;
  late final JoystickComponent _rotateJoystick;
  late final AdventurerComponent _player;

  @override
  Future<void>? onLoad() async {
    final Paint knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final Paint backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    _moveJoystick = JoystickComponent(
      knob: CircleComponent(radius: 25, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 16, bottom: 48),
    );
    await add(_moveJoystick);

    _rotateJoystick = JoystickComponent(
      knob: CircleComponent(radius: 25, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(right: 16, bottom: 48),
    );
    await add(_rotateJoystick);

    _player = AdventurerComponent();
    await add(_player);
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// 角色移动
    if (!_moveJoystick.delta.isZero()) {
      final Vector2 ds = _moveJoystick.relativeDelta * _player.speed * dt;
      _player.move(ds);
    }

    /// 角色旋转
    if (!_rotateJoystick.delta.isZero()) {
      _player.rotateTo(_rotateJoystick.delta.screenAngle());
    } else {
      _player.rotateTo(0);
    }
  }
}
