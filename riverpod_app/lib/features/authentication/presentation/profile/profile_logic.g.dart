// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileLogic)
const profileLogicProvider = ProfileLogicProvider._();

final class ProfileLogicProvider
    extends $AsyncNotifierProvider<ProfileLogic, void> {
  const ProfileLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileLogicHash();

  @$internal
  @override
  ProfileLogic create() => ProfileLogic();
}

String _$profileLogicHash() => r'500976359e7e75c275152aad41e73e718d354ecb';

abstract class _$ProfileLogic extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
