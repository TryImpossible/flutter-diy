import 'package:flame/game.dart';

import 'component.dart';

class OwnGame extends FlameGame with HasTappables, HasHoverables {
  late final AdventurerComponent _player;

  @override
  Future<void>? onLoad() async {
    _player = AdventurerComponent();
    await add(_player);
  }
}
