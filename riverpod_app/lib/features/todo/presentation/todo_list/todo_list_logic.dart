import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/todo/domain/todo_entity.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'todo_list_logic.g.dart';

@riverpod
class TodoListLogic extends _$TodoListLogic {
  @override
  List<TodoEntity> build() {
    return List.generate(
      3,
      (int index) => TodoEntity(
        id: Random().nextInt(10000000).toString(),
        name: '待办 ${index + 1}',
      ),
    );
  }

  void toAddTodo() {
    ref.read(appLinkProvider).toAddTodo();
  }

  void addTodo(String name) {
    final List<TodoEntity> todos = List.from(state);
    final TodoEntity todo =
        TodoEntity(id: Random().nextInt(10000000).toString(), name: name);
    todos.add(todo);
    state = todos;
  }

  void toTodoDetails(int index) {
    ref.read(appLinkProvider).toTodoDetails(index);
  }

  void removeTodo(int index) {
    final List<TodoEntity> todos = List.from(state);
    todos.removeAt(index);
    state = todos;
  }
}
