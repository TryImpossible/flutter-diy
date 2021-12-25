import 'package:flutter/material.dart';

class AlignActivity extends StatefulWidget {
  const AlignActivity({Key? key}) : super(key: key);

  @override
  _AlignActivityState createState() => _AlignActivityState();
}

class _AlignActivityState extends State<AlignActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align控件'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Material(
                color: Colors.blue.shade100,
                child: Align(
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
                child: Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(size: 60.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标:\n'
              '(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)'),
          Material(
            color: Colors.blue.shade100,
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment(2, 0.0),
              child: FlutterLogo(size: 60.0),
            ),
          ),
          SizedBox(height: 10),
          Text('FractionalOffset可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标:\n'
              '实际偏移 = (FractionalOffset.x * childWidth, FractionalOffset.y * childHeight)'),
          Container(
            color: Colors.blue.shade100,
            width: 120.0,
            height: 120.0,
            child: Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return FlutterLogo(size: 60.0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
