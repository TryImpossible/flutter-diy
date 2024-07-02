import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppNavBar(
        titleText: '商品详情',
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            product.puzzleUrl ?? '',
            width: double.infinity,
          ),
          Text(
            product.name ?? '',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
