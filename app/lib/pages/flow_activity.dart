import 'package:flutter/material.dart';

class FlowActivity extends StatefulWidget {
  const FlowActivity({Key? key}) : super(key: key);

  @override
  _FlowActivityState createState() => _FlowActivityState();
}

class _FlowActivityState extends State<FlowActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow控件'),
      ),
      body: Container(
        child: Flow(
          delegate: TestFlowDelegate(),
          children: <Widget>[
            Container(width: 120.0, height: 120.0, color: Colors.red),
            Container(width: 120.0, height: 120.0, color: Colors.green),
            Container(width: 120.0, height: 120.0, color: Colors.blue),
            Container(width: 120.0, height: 120.0, color: Colors.yellow),
            Container(width: 120.0, height: 120.0, color: Colors.brown),
            Container(width: 120.0, height: 120.0, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  TestFlowDelegate({this.margin = EdgeInsets.zero});

  EdgeInsets margin;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0, y = 0;
    for (int i = 0; i < context.childCount; i++) {
      Size size = context.getChildSize(i) ?? Size.zero;
      double w = x + size.width;
      if (w < context.size.width) {
        context.paintChild(
          i,
          transform: Matrix4.translationValues(x, y, 0),
          opacity: 1,
        );
        x = w;
      } else {
        x = 0;
        y += size.height;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(x, y, 0),
          opacity: 1,
        );
        x += size.width;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 240.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    throw oldDelegate != this;
  }
}
