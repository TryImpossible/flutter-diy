import 'package:flame/game.dart';

import 'component.dart';

class HeroGame extends FlameGame with HasTappables, HasHoverables {
  late final HeroComponent _player;

  @override
  Future<void>? onLoad() async {
    _player = HeroComponent();
    await add(_player);
  }
}
