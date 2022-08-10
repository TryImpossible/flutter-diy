import 'package:flame/game.dart';
import 'package:game/course/01/component.dart';

class HeroGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await add(HeroComponent());
  }
}
