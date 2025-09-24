// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingCartLogic)
const shoppingCartLogicProvider = ShoppingCartLogicProvider._();

final class ShoppingCartLogicProvider
    extends $AsyncNotifierProvider<ShoppingCartLogic, List<ProductEntity>> {
  const ShoppingCartLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingCartLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingCartLogicHash();

  @$internal
  @override
  ShoppingCartLogic create() => ShoppingCartLogic();
}

String _$shoppingCartLogicHash() => r'5da7661820b05b89f3e36b82c0163b8424e31b4c';

abstract class _$ShoppingCartLogic extends $AsyncNotifier<List<ProductEntity>> {
  FutureOr<List<ProductEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductEntity>>, List<ProductEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductEntity>>, List<ProductEntity>>,
              AsyncValue<List<ProductEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
