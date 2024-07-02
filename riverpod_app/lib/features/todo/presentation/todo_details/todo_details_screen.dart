import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/todo/domain/todo_entity.dart';
import 'package:riverpod_app/features/todo/presentation/add_todo/add_todo_logic.dart';
import 'package:riverpod_app/features/todo/presentation/todo_details/todo_details_logic.dart';
import 'package:riverpod_app/features/todo/presentation/todo_list/todo_list_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class TodoDetailsScreen extends ConsumerWidget {
  const TodoDetailsScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TodoEntity todo = ref.read(todoListLogicProvider)[index];
    // 须加上这行产生依赖关系，否则todoDetailsLogicProvider会自动销毁
    ref.watch(todoDetailsLogicProvider);
    return Scaffold(
      appBar: const AppNavBar(
        titleText: '待办详情',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(todo.name),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: () =>
                    ref.read(todoDetailsLogicProvider.notifier).delete(index),
                child: const Text('删除'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
