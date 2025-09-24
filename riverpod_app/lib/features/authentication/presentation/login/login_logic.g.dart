// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginLogic)
const loginLogicProvider = LoginLogicFamily._();

final class LoginLogicProvider
    extends $AsyncNotifierProvider<LoginLogic, bool> {
  const LoginLogicProvider._({
    required LoginLogicFamily super.from,
    required ({String? then, String? isPop}) super.argument,
  }) : super(
         retry: null,
         name: r'loginLogicProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loginLogicHash();

  @override
  String toString() {
    return r'loginLogicProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  LoginLogic create() => LoginLogic();

  @override
  bool operator ==(Object other) {
    return other is LoginLogicProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loginLogicHash() => r'1276195d8292d4dd1772995970be8c03616a4d0d';

final class LoginLogicFamily extends $Family
    with
        $ClassFamilyOverride<
          LoginLogic,
          AsyncValue<bool>,
          bool,
          FutureOr<bool>,
          ({String? then, String? isPop})
        > {
  const LoginLogicFamily._()
    : super(
        retry: null,
        name: r'loginLogicProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoginLogicProvider call({String? then, String? isPop}) =>
      LoginLogicProvider._(argument: (then: then, isPop: isPop), from: this);

  @override
  String toString() => r'loginLogicProvider';
}

abstract class _$LoginLogic extends $AsyncNotifier<bool> {
  late final _$args = ref.$arg as ({String? then, String? isPop});
  String? get then => _$args.then;
  String? get isPop => _$args.isPop;

  FutureOr<bool> build({String? then, String? isPop});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(then: _$args.then, isPop: _$args.isPop);
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
