import 'dart:math';

import 'package:flutter/material.dart';

class CustomMultiChildLayoutPage extends StatelessWidget {
  const CustomMultiChildLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChildLayout'),
      ),
      body: _WaterfallFlow(
        children: List.generate(18, (int index) {
          return LayoutId(
            id: 'id_$index',
            child: Container(
              width: 100,
              height: 40 + Random().nextDouble() * 100,
              color: Colors.primaries[index % Colors.primaries.length],
              child: FlutterLogo(),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _WaterfallFlow extends StatelessWidget {
  const _WaterfallFlow({
    Key? key,
    this.children = const <LayoutId>[],
  }) : super(key: key);
  final List<LayoutId> children;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _WaterfallDelegate(
        itemCount: children.length,
        crossAxisCount: 3,
        padding: 5,
      ),
      children: children,
    );
  }
}

class _WaterfallDelegate extends MultiChildLayoutDelegate {
  _WaterfallDelegate({
    required this.itemCount,
    required this.crossAxisCount,
    required this.padding,
  });

  final int itemCount;
  final int crossAxisCount;
  final int padding;

  @override
  void performLayout(Size size) {
    final double itemTotalWidth = (size.width - (crossAxisCount - 1) * padding);
    final double itemWidth = itemTotalWidth / crossAxisCount;

    List columnOffsetY = List.generate(crossAxisCount, (index) {
      return 0.0;
    });
    for (int i = 0; i < itemCount; i++) {
      final row = i ~/ crossAxisCount;
      final column = i % 3;

      // 布局子元素，获得尺寸
      Size itemSize = layoutChild(
        'id_$i',
        BoxConstraints(
          minWidth: itemWidth,
          maxWidth: itemWidth,
          minHeight: 0,
          maxHeight: 1000,
        ),
      );

      final double dx = (itemSize.width + padding) * column;
      final double dy = columnOffsetY[column];
      debugPrint("item offset : $dx----$dy");
      // 指定子元素位置
      positionChild('id_$i', Offset(dx, dy));
      columnOffsetY[column] += itemSize.height + padding;
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
