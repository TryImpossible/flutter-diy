import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/todo/domain/todo_entity.dart';
import 'package:riverpod_app/features/todo/presentation/todo_list/todo_list_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TodoEntity> todos = ref.watch(todoListLogicProvider);
    return Scaffold(
      appBar: AppNavBar(
        titleText: '待办列表',
        menuText: '添加',
        onMenuTap: ref.read(todoListLogicProvider.notifier).toAddTodo,
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final TodoEntity todo = todos[index];
          return ListTile(
            title: Text(todo.name),
            onTap: () =>
                ref.read(todoListLogicProvider.notifier).toTodoDetails(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
