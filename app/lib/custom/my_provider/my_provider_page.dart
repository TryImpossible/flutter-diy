import 'dart:collection';

import 'package:flutter/material.dart';

import 'change_notifier_provider.dart';
import 'consumer.dart';

class Item {
  Item(this.price, this.count);

  /// 商品单价
  double price;

  /// 商品份数
  int count;
}

class CartModel extends ChangeNotifier {
  /// 用于保存购物车中商品列表
  final List<Item> _items = [];

  /// 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  /// 购物车商品的总价
  double get totalPrice => _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.count * element.price);

  /// 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);

    /// 通知监听器（订阅者），重新构建InheritedProvicer，更新状态
    notifyListeners();
  }
}

class MyProviderPage extends StatefulWidget {
  const MyProviderPage({Key? key}) : super(key: key);

  @override
  State<MyProviderPage> createState() => _MyProviderPageState();
}

class _MyProviderPageState extends State<MyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyProvider'),
      ),
      body: Center(
        child: ChangeNotifierProvider(
          data: CartModel(),
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Consumer<CartModel>(
                    builder: (BuildContext context, CartModel cart) {
                      return Text('总价：${cart.totalPrice}');
                    },
                  ),
                  Builder(builder: (BuildContext context) {
                    debugPrint('ElevatedButton build');
                    return ElevatedButton(
                      onPressed: () {
                        // 给购物车中添加商品，添加后总价会更新
                        // listen 设为 false，不建立依赖关系
                        ChangeNotifierProvider.of<CartModel>(context,
                                listen: false)
                            .add(Item(20.0, 1));
                      },
                      child: const Text('添加商品'),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
