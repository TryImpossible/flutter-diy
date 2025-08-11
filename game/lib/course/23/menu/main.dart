import 'package:flutter/material.dart';
import 'package:game/course/23/l10n/l10n.dart';

import '../app/key.dart';
import '../main.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  final TextStyle shadowStyle = const TextStyle(
    fontSize: 30,
    shadows: [Shadow(color: Colors.white, blurRadius: 10)],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 20,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Adventurer', style: shadowStyle),
            ElevatedButton(onPressed: _doPlay, child: Text(context.l10n.play)),
            ElevatedButton(
              onPressed: _toOptions,
              child: Text(context.l10n.options),
            ),
          ],
        ),
      ),
    );
  }

  void _doPlay() {
    Keys.navigator?.pushReplacement(
      MaterialPageRoute(builder: (ctx) => const GameWorld()),
    );
  }

  void _toOptions() {}
}
