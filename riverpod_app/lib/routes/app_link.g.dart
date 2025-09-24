// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_link.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appLink)
const appLinkProvider = AppLinkProvider._();

final class AppLinkProvider
    extends $FunctionalProvider<AppLink, AppLink, AppLink>
    with $Provider<AppLink> {
  const AppLinkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLinkHash();

  @$internal
  @override
  $ProviderElement<AppLink> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLink create(Ref ref) {
    return appLink(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLink value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLink>(value),
    );
  }
}

String _$appLinkHash() => r'4cf7416f5fa44c8537daa2318a62d29d934b95bc';
