import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/main/presentation/not_found/not_found_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({
    super.key,
    this.uri,
  });

  final String? uri;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppNavBar(
        titleText: '404',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Can't find a page for: $uri"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: ref.read(notFoundLogicProvider.notifier).toMain,
              child: const Text('回到主页'),
            ),
          ],
        ),
      ),
    );
  }
}
