import 'package:flutter/material.dart';

class AlignPage extends StatefulWidget {
  const AlignPage({Key? key}) : super(key: key);

  @override
  State<AlignPage> createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align控件'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Material(
                color: Colors.blue.shade100,
                child: const Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment.topRight,
                  child: FlutterLogo(size: 60.0),
                ),
              ),
              Container(
                color: Colors.blue.shade100,
                width: 120.0,
                height: 120.0,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(size: 60.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标:\n'
              '(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)'),
          Material(
            color: Colors.blue.shade100,
            child: const Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment(2, 0.0),
              child: FlutterLogo(size: 60.0),
            ),
          ),
          const SizedBox(height: 10),
          const Text('FractionalOffset可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标:\n'
              '实际偏移 = (FractionalOffset.x * childWidth, FractionalOffset.y * childHeight)'),
          Container(
            color: Colors.blue.shade100,
            width: 120.0,
            height: 120.0,
            child: Align(
              alignment: const FractionalOffset(0.2, 0.6),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return const FlutterLogo(size: 60.0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
