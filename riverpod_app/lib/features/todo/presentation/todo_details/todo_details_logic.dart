import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/todo/presentation/todo_list/todo_list_logic.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'todo_details_logic.g.dart';

@riverpod
class TodoDetailsLogic extends _$TodoDetailsLogic {
  @override
  void build() {}

  void delete(int index) {
    ref.read(todoListLogicProvider.notifier).removeTodo(index);
    ref.read(appLinkProvider).pop();
  }
}
