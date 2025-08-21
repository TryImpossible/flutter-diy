import 'dart:async';

import 'package:flame/game.dart';

import 'component.dart';

class OwnGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    add(HeroMan()..position = size / 2);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    print(size);
  }
}
