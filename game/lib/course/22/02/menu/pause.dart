import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../app/key.dart';
import 'main.dart';

class PauseMenu extends StatelessWidget {
  static const String menuId = 'PauseMenu';
  const PauseMenu({super.key, required this.game});
  final Game game;

  final TextStyle shadowStyle = const TextStyle(
    fontSize: 24,
    shadows: [Shadow(color: Colors.white, blurRadius: 10)],
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          color: Colors.black54,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            spacing: 20,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('游戏暂停', style: shadowStyle),
              ElevatedButton(onPressed: _continue, child: Text('继续游戏')),
              ElevatedButton(onPressed: _restart, child: Text('重新开始')),
              ElevatedButton(onPressed: _exit, child: Text('退出游戏')),
            ],
          ),
        ),
      ),
    );
  }

  void _continue() {
    game.resumeEngine();
    game.overlays.remove(menuId);
  }

  void _restart() {}

  void _exit() {
    Keys.navigator?.pushReplacement(
      MaterialPageRoute(builder: (ctx) => const MainMenu()),
    );
  }
}
