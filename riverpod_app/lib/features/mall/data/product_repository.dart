import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';

part 'product_repository.g.dart';

class ProductRepository {
  Future<List<ProductEntity>> requestProductList() async {
    const String path =
        'https://apis.netstart.cn/xmsc/product/all_product?cat_id=1836';
    final Response response = await Dio().get(path);
    List<Map<String, dynamic>> products =
        response.data['data']['product'].cast<Map<String, dynamic>>();
    return products
        .map((Map<String, dynamic> json) => ProductEntity.fromJson(json))
        .toList();
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository();
}
