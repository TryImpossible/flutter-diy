import 'package:flutter/material.dart';

class DiagonalLayoutPage extends StatelessWidget {
  const DiagonalLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('斜着布局')),
      body: DiagonalLayout(
        children: <Widget>[
          Text('123'),
          Container(width: 100, height: 30, color: Colors.redAccent),
          Text('456', style: TextStyle(fontSize: 20)),
          Image.asset("assets/images/lufei.jpeg", width: 60.0),
        ],
      ),
    );
  }
}

class DiagonalLayout extends StatelessWidget {
  const DiagonalLayout({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: DiagonalLayoutDelegate(),
      children: <Widget>[
        for (int i = 0; i < children.length; i++)
          LayoutId(id: i, child: children[i]),
      ],
    );
  }
}

class DiagonalLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Offset offset = Offset.zero;
    for (int i = 0; ; i++) {
      if (hasChild(i)) {
        final Size childSize = layoutChild(i, BoxConstraints.loose(size));
        positionChild(i, offset);
        offset += Offset(childSize.width, childSize.height);
      } else {
        break;
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
