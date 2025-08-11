import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/key.dart';
import 'game.dart';
import 'l10n/arb/app_localizations.dart';
import 'menu/main.dart';
import 'menu/pause.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeRight,
  ]);
  runApp(GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocalizations.supportedLocales[1],
      debugShowCheckedModeBanner: false,
      navigatorKey: Keys.navKey,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'ZCOOLKuaiLe',
      ),
      home: const MainMenu(),
    );
  }
}

class GameWorld extends StatelessWidget {
  const GameWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: OwnGame(),
      overlayBuilderMap: {
        PauseMenu.menuId: (_, Game game) => PauseMenu(game: game),
      },
    );
  }
}
