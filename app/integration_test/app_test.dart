import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app/main.dart' as app;

void main() {
  /// flutter drive --driver=test_driver/integration_test.dart  --target=integration_test/app_test.dart

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button; verify counter',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      // Finds the floating action button to tap on.
      final Finder listViewPage = find.text('ListView系列控件');

      // Emulate a tap on the floating action button.
      await tester.tap(listViewPage);

      await tester.pumpAndSettle();

      await tester.flingFrom(Offset(100, 230), Offset(100, -812), 500.0);

      await tester.flingFrom(Offset(200, 500), Offset(200, 200), 500.0);

      sleep(Duration(seconds: 10));
    });
  });
}
