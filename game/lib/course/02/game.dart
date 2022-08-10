import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';

import 'component.dart';

class HeroGame extends FlameGame with HasDraggables {
  late final JoystickComponent _joystick;
  late final HeroComponent _player;

  @override
  Future<void>? onLoad() async {
    final Paint knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final Paint backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    _joystick = JoystickComponent(
      knob: CircleComponent(radius: 25, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    await add(_joystick);

    _player = HeroComponent();
    await add(_player);
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// 角色移动
    if (!_joystick.delta.isZero()) {
      final Vector2 ds = _joystick.relativeDelta * _player.speed * dt;
      _player.move(ds);
    }

    /// 角色旋转
    // if (!_joystick.delta.isZero()) {
    //   _player.rotateTo(_joystick.delta.screenAngle());
    // } else {
    //   _player.rotateTo(0);
    // }
  }
}
