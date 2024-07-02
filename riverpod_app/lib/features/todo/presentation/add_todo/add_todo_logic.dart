import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/todo/presentation/todo_list/todo_list_logic.dart';
import 'package:riverpod_app/routes/app_link.dart';
part 'add_todo_logic.g.dart';

@riverpod
class AddTodoLogic extends _$AddTodoLogic {
  String _name = '';

  set name(String value) => _name = value;

  @override
  void build() {}

  void confirm() {
    ref.read(todoListLogicProvider.notifier).addTodo(_name);
    ref.read(appLinkProvider).pop();
  }
}
