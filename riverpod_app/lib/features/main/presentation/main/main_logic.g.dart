// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainLogic)
const mainLogicProvider = MainLogicProvider._();

final class MainLogicProvider extends $NotifierProvider<MainLogic, int> {
  const MainLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainLogicHash();

  @$internal
  @override
  MainLogic create() => MainLogic();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$mainLogicHash() => r'48520b5575b67e18ccbf026e4b1d00cfc65f06c7';

abstract class _$MainLogic extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
