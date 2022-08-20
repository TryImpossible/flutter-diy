import 'package:flame/game.dart';

import 'component.dart';

class OwnGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await add(AdventurerComponent());
  }
}
