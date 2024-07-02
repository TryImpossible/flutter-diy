import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/mall/data/product_repository.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'product_list_logic.g.dart';

@riverpod
class ProductListLogic extends _$ProductListLogic {
  @override
  FutureOr<List<ProductEntity>> build() async {
    return getProductList();
  }

  Future<List<ProductEntity>> getProductList() {
    return ref.read(productRepositoryProvider).requestProductList();
  }

  void toProductDetails(int index) {
    ref.read(appLinkProvider).toProductDetails(state.requireValue[index]);
  }
}
