// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_details_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoDetailsLogic)
const todoDetailsLogicProvider = TodoDetailsLogicProvider._();

final class TodoDetailsLogicProvider
    extends $NotifierProvider<TodoDetailsLogic, void> {
  const TodoDetailsLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoDetailsLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoDetailsLogicHash();

  @$internal
  @override
  TodoDetailsLogic create() => TodoDetailsLogic();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$todoDetailsLogicHash() => r'5570d5815e287291cf1271862b938e16df2327ac';

abstract class _$TodoDetailsLogic extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
