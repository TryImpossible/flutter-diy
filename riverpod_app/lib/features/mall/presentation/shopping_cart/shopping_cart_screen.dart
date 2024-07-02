import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/features/mall/presentation/shopping_cart/shopping_cart_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ProductEntity>> products =
        ref.watch(shoppingCartLogicProvider);
    return Scaffold(
      appBar: const AppNavBar(
        titleText: '购物车',
      ),
      body: products.when(
        data: (List<ProductEntity> value) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductEntity product = value[index];
              return _ProductItem(
                product: product,
                onTap: () => ref
                    .read(shoppingCartLogicProvider.notifier)
                    .toProductDetails(index),
              );
            },
          );
        },
        error: (Object? error, StackTrace stack) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductEntity product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Image.network(
            product.puzzleUrl ?? '',
            fit: BoxFit.contain,
            width: 80,
          ),
          Expanded(
            child: Text(
              product.name ?? '',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
