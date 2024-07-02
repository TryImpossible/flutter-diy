import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/widgets/widgets.dart';

import 'login_logic.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
    this.then,
    this.isPop,
  });

  final String? then;
  final String? isPop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginLogicProvider provider =
        loginLogicProvider(then: then, isPop: isPop);
    final AsyncValue<void> user = ref.watch(provider);
    ref.listen<AsyncValue>(
      provider,
      (AsyncValue? prev, AsyncValue? next) {
        if (next != null && next.valueOrNull == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('登录成功')));
        }
      },
    );
    return Scaffold(
      appBar: const AppNavBar(titleText: '登录'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: ref.read(provider.notifier).usernameEditingController,
              decoration: const InputDecoration(hintText: '请输入用户名称'),
            ),
            TextField(
              decoration: const InputDecoration(hintText: '请输入用户密码'),
              obscureText: true,
              onChanged: (String value) {
                ref.read(provider.notifier).password = value;
              },
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: () {
                ref.read(provider.notifier).login();
              },
              child: user.when(
                loading: () => const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => const Text('登录'),
                data: (_) => const Text('登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
