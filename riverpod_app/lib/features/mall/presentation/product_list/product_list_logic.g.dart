// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductListLogic)
const productListLogicProvider = ProductListLogicProvider._();

final class ProductListLogicProvider
    extends $AsyncNotifierProvider<ProductListLogic, List<ProductEntity>> {
  const ProductListLogicProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productListLogicProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productListLogicHash();

  @$internal
  @override
  ProductListLogic create() => ProductListLogic();
}

String _$productListLogicHash() => r'b2a723ac2901dbea734614583fca99320faee784';

abstract class _$ProductListLogic extends $AsyncNotifier<List<ProductEntity>> {
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
