// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_found_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotFoundLogic)
const notFoundLogicProvider = NotFoundLogicProvider._();

final class NotFoundLogicProvider
    extends $NotifierProvider<NotFoundLogic, void> {
  const NotFoundLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notFoundLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notFoundLogicHash();

  @$internal
  @override
  NotFoundLogic create() => NotFoundLogic();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$notFoundLogicHash() => r'7c59da3d85e8fc65daef06baebfd216205c3668d';

abstract class _$NotFoundLogic extends $Notifier<void> {
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
