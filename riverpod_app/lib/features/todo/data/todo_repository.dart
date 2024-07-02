import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_repository.g.dart';


class TodoRepository {
  
}

@riverpod
TodoRepository todoRepository (TodoRepositoryRef ref) {
  return TodoRepository();
}