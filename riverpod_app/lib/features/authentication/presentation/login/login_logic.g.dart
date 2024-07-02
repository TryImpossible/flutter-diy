// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginLogicHash() => r'1276195d8292d4dd1772995970be8c03616a4d0d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LoginLogic extends BuildlessAutoDisposeAsyncNotifier<bool> {
  late final String? then;
  late final String? isPop;

  FutureOr<bool> build({
    String? then,
    String? isPop,
  });
}

/// See also [LoginLogic].
@ProviderFor(LoginLogic)
const loginLogicProvider = LoginLogicFamily();

/// See also [LoginLogic].
class LoginLogicFamily extends Family<AsyncValue<bool>> {
  /// See also [LoginLogic].
  const LoginLogicFamily();

  /// See also [LoginLogic].
  LoginLogicProvider call({
    String? then,
    String? isPop,
  }) {
    return LoginLogicProvider(
      then: then,
      isPop: isPop,
    );
  }

  @override
  LoginLogicProvider getProviderOverride(
    covariant LoginLogicProvider provider,
  ) {
    return call(
      then: provider.then,
      isPop: provider.isPop,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginLogicProvider';
}

/// See also [LoginLogic].
class LoginLogicProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LoginLogic, bool> {
  /// See also [LoginLogic].
  LoginLogicProvider({
    String? then,
    String? isPop,
  }) : this._internal(
          () => LoginLogic()
            ..then = then
            ..isPop = isPop,
          from: loginLogicProvider,
          name: r'loginLogicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginLogicHash,
          dependencies: LoginLogicFamily._dependencies,
          allTransitiveDependencies:
              LoginLogicFamily._allTransitiveDependencies,
          then: then,
          isPop: isPop,
        );

  LoginLogicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.then,
    required this.isPop,
  }) : super.internal();

  final String? then;
  final String? isPop;

  @override
  FutureOr<bool> runNotifierBuild(
    covariant LoginLogic notifier,
  ) {
    return notifier.build(
      then: then,
      isPop: isPop,
    );
  }

  @override
  Override overrideWith(LoginLogic Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoginLogicProvider._internal(
        () => create()
          ..then = then
          ..isPop = isPop,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        then: then,
        isPop: isPop,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<LoginLogic, bool> createElement() {
    return _LoginLogicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginLogicProvider &&
        other.then == then &&
        other.isPop == isPop;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, then.hashCode);
    hash = _SystemHash.combine(hash, isPop.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginLogicRef on AutoDisposeAsyncNotifierProviderRef<bool> {
  /// The parameter `then` of this provider.
  String? get then;

  /// The parameter `isPop` of this provider.
  String? get isPop;
}

class _LoginLogicProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LoginLogic, bool>
    with LoginLogicRef {
  _LoginLogicProviderElement(super.provider);

  @override
  String? get then => (origin as LoginLogicProvider).then;
  @override
  String? get isPop => (origin as LoginLogicProvider).isPop;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
