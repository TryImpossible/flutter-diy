import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';

class ParallaxExample extends FlameGame {
  final List<ParallaxImageData> _imageNames = [
    ParallaxImageData('parallax/bg.png'),
    ParallaxImageData('parallax/mountain-far.png'),
    ParallaxImageData('parallax/mountains.png'),
    ParallaxImageData('parallax/trees.png'),
    ParallaxImageData('parallax/foreground-trees.png'),
  ];
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final ParallaxComponent parallax = await loadParallaxComponent(
      _imageNames,
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.4, 1.0),
    );
    add(parallax);
  }
}
