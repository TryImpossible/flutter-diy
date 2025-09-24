import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/mall/data/product_repository.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'product_list_logic.g.dart';

final inputControllerProvider = Provider.autoDispose<TextEditingController>((
  ref,
) {
  final TextEditingController controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

@riverpod
class ProductListLogic extends _$ProductListLogic {
  final List<ProductEntity> _originProducts = <ProductEntity>[];

  @override
  FutureOr<List<ProductEntity>> build() async {
    return getProductList();
  }

  List<ProductEntity> _filterProducts() {
    final String key = ref.watch(inputControllerProvider).text;
    final List<ProductEntity> products = _originProducts
        .where((ProductEntity product) => product.name?.contains(key) ?? false)
        .toList();
    return products;
  }

  Future<List<ProductEntity>> getProductList() async {
    List<ProductEntity> products = await ref
        .read(productRepositoryProvider)
        .requestProductList();
    _originProducts
      ..clear()
      ..addAll(products);
    products = _filterProducts();
    return products;
  }

  void queryProduct() {
    state = AsyncData(_filterProducts());
  }

  void toProductDetails(int index) {
    ref.read(appLinkProvider).toProductDetails(state.requireValue[index]);
  }
}
