import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'parallax_example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(GameWidget(game: ParallaxExample()));
}
