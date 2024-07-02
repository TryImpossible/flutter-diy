import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/todo/presentation/add_todo/add_todo_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class AddTodoScreen extends ConsumerWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 须加上这行产生依赖关系，否则addTodoLogicProvider会自动销毁
    ref.watch(addTodoLogicProvider);
    return Scaffold(
      appBar: const AppNavBar(
        titleText: '添加待办',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: '请输入待办事项',
              ),
              onChanged: (String value) {
                ref.read(addTodoLogicProvider.notifier).name = value;
              },
            ),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: ref.read(addTodoLogicProvider.notifier).confirm,
              child: const Text('确认'),
            ),
          ],
        ),
      ),
    );
  }
}
