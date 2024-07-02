import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/authentication/data/auth_repository.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'shopping_cart_logic.g.dart';

@riverpod
class ShoppingCartLogic extends _$ShoppingCartLogic {
  @override
  FutureOr<List<ProductEntity>> build() async {
    return <ProductEntity>[];
  }

  void addProduct(ProductEntity product) {
    if (!ref.read(authRepositoryProvider).isLoggedIn) {
      ref.read(appLinkProvider).toLogin(isPop: true);
      return;
    }
    final List<ProductEntity> products = List.from(state.value ?? []);
    products.add(product);
    state = AsyncData(products);
  }

  void toProductDetails(int index) {
    ref.read(appLinkProvider).toProductDetails(state.requireValue[index]);
  }
}
