// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoListLogic)
const todoListLogicProvider = TodoListLogicProvider._();

final class TodoListLogicProvider
    extends $NotifierProvider<TodoListLogic, List<TodoEntity>> {
  const TodoListLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListLogicHash();

  @$internal
  @override
  TodoListLogic create() => TodoListLogic();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TodoEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodoEntity>>(value),
    );
  }
}

String _$todoListLogicHash() => r'eafedf7203783136ff5f2e469f81da7d4147081c';

abstract class _$TodoListLogic extends $Notifier<List<TodoEntity>> {
  List<TodoEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TodoEntity>, List<TodoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TodoEntity>, List<TodoEntity>>,
              List<TodoEntity>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
