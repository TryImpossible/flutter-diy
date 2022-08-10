import 'package:flame/game.dart';

import 'component.dart';

class HeroGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await add(HeroComponent());
  }
}
