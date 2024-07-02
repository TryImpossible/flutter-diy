import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/features/mall/presentation/product_list/product_list_logic.dart';
import 'package:riverpod_app/features/mall/presentation/shopping_cart/shopping_cart_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ProductEntity>> products =
        ref.watch(productListLogicProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: '输入你喜欢的商品'),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('搜索'),
              )
            ],
          ),
        ),
      ),
      body: products.when(
        data: (List<ProductEntity> value) {
          return RefreshIndicator(
            onRefresh: () => ref.refresh(productListLogicProvider.future),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                final ProductEntity product = value[index];
                return _ProductItem(
                  product: product,
                  onTap: () => ref
                      .read(productListLogicProvider.notifier)
                      .toProductDetails(index),
                  onAddTap: () => ref
                      .read(shoppingCartLogicProvider.notifier)
                      .addProduct(product),
                );
              },
            ),
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
    required this.onAddTap,
  });

  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              product.puzzleUrl ?? '',
              fit: BoxFit.contain,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  product.name ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                onPressed: onAddTap,
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
