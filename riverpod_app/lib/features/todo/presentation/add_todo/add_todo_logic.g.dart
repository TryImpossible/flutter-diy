// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddTodoLogic)
const addTodoLogicProvider = AddTodoLogicProvider._();

final class AddTodoLogicProvider extends $NotifierProvider<AddTodoLogic, void> {
  const AddTodoLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addTodoLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addTodoLogicHash();

  @$internal
  @override
  AddTodoLogic create() => AddTodoLogic();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$addTodoLogicHash() => r'bb1d3f7547d7bcd2c9002531ee5010eda481c7e1';

abstract class _$AddTodoLogic extends $Notifier<void> {
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
