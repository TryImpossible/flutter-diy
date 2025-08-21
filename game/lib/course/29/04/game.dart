import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'components/ember.dart';
import 'components/map.dart';
import 'components/rock.dart';

class OwnGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents, TapDetector {
  static const String description = '''
    Move around with W, A, S, D and notice how the camera follows the ember 
    sprite.\n
    If you collide with the gray squares, the camera reference is changed from
    center to topCenter.\n
    The gray squares can also be clicked to show how the coordinate system
    respects the camera transformation.
  ''';

  late Ember ember;

  @override
  Future<void> onLoad() async {
    final Vector2 fixSize = Vector2(500, 500);
    camera.viewport = FixedResolutionViewport(resolution: fixSize);

    world.add(Map());
    world.add(ember = Ember());

    camera.setBounds(Map.bounds);
    camera.follow(ember, maxSpeed: 250);

    world.addAll(List.generate(30, (_) => Rock(Map.generateCoordinates())));
  }
}
