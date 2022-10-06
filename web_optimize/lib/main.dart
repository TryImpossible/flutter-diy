import 'package:flutter/material.dart';

import 'app.dart' deferred as app;

Future<void> main() async {
  await app.loadLibrary();
  runApp(app.MyApp());
}
