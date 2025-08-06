import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'example/particles_example.dart';
import 'example/particles_interactive_example.dart';
import 'game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  // runApp(GameWidget(game: ParticlesInteractiveExample.demo()));
  // runApp(GameWidget(game: ParticlesExample()));
  runApp(GameWidget(game: OwnGame()));
}
