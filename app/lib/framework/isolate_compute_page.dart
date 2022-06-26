import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateComputePage extends StatefulWidget {
  const IsolateComputePage({Key? key}) : super(key: key);

  @override
  _IsolateComputePageState createState() => _IsolateComputePageState();
}

class _IsolateComputePageState extends State<IsolateComputePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IsolateCompute'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _update,
              child: Text(
                '点击我更新：$_count',
                textScaleFactor: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _update() async {
    // _count = countEven(1000000000);
    _count = await compute(countEven, 1000000000);
    setState(() {});
  }

  //计算偶数的个数
  static int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  static Future<dynamic> isolateCountEven(int num) async {
    final response = ReceivePort();
    await Isolate.spawn((message) { }, response.sendPort);
    final sendPort = await response.first;
    final answer = ReceivePort();
  }
}
