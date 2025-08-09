import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';

class ParallaxExample extends FlameGame {
  final Map<String, double> _layersMeta = {
    'parallax/bg.png': 1.0,
    'parallax/mountain-far.png': 1.5,
    'parallax/mountains.png': 2.3,
    'parallax/trees.png': 3.8,
    'parallax/foreground-trees.png': 6.6,
  };

  Future<List<ParallaxLayer>> fromLayerByMap(Map<String, double> data) async {
    final List<ParallaxLayer> result = <ParallaxLayer>[];
    for (String image in data.keys) {
      ParallaxLayer layer = await loadParallaxLayer(
        ParallaxImageData(image),
        velocityMultiplier: Vector2(data[image]!, 1.0),
      );
      result.add(layer);
    }
    return result;
  }

  Future<ParallaxLayer> getAirplaneLayer() async {
    final ParallaxLayer airplaneLayer = await loadParallaxLayer(
      ParallaxAnimationData(
        'parallax/airplane.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(320, 160),
        ),
      ),
      repeat: ImageRepeat.noRepeat,
      velocityMultiplier: Vector2.zero(),
      fill: LayerFill.none,
      alignment: Alignment.center,
    );
    return airplaneLayer;
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final List<ParallaxLayer> layers = await fromLayerByMap(_layersMeta);
    final ParallaxLayer airplaneLayer = await getAirplaneLayer();
    layers.add(airplaneLayer);
    final ParallaxComponent parallax = ParallaxComponent(
      parallax: Parallax(layers, baseVelocity: Vector2(20, 0)),
    );
    add(parallax);
  }
}
