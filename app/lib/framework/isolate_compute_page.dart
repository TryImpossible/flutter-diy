import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateComputePage extends StatefulWidget {
  const IsolateComputePage({Key? key}) : super(key: key);

  @override
  State<IsolateComputePage> createState() => _IsolateComputePageState();
}

class _IsolateComputePageState extends State<IsolateComputePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IsolateCompute'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              '通过复杂计算，测试页面是否会卡顿\n注意loading状态',
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircularProgressIndicator(),
              ),
            ),
            Text('当前值：$_count'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _test1, child: const Text('主线程')),
                ElevatedButton(onPressed: _test2, child: const Text('compute')),
                ElevatedButton(
                  onPressed: _test3,
                  child: const Text('isolate1'),
                ),
                ElevatedButton(
                  onPressed: _test4,
                  child: const Text('isolate2'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _test1() {
    _count = _performCompute(1000000000);
    setState(() {});
  }

  void _test2() async {
    _count = await compute(_performCompute, 2000000000);
    setState(() {});
  }

  //计算偶数的个数
  static int _performCompute(int num) {
    int count = 0;
    while (num > 0) {
      count++;
      num--;
    }
    return count;
  }

  void _test3() async {
    final ReceivePort p = ReceivePort();
    await Isolate.spawn(_fun, [p.sendPort, 3000000000]);
    _count = await p.first;
    setState(() {});
  }

  static void _fun(List<dynamic> args) {
    SendPort responsePort = args[0];
    int total = args[1];
    int count = _performCompute(total);
    Isolate.exit(responsePort, count);
  }

  void _test4() async {
    final ReceivePort p = ReceivePort();
    Isolate.spawn(_fun2, p.sendPort);
    p.listen((dynamic message) {
      if (message is SendPort) {
        // 接收新的Isolate发送过来的SendPort，并将要将计算的值发送过去
        final SendPort sendPort = message;
        sendPort.send(4000000000);
      } else if (message is int) {
        // 接收新的Isolate计算结果，并刷新
        _count = message;
        setState(() {});
      }
    });
  }

  static void _fun2(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    // 新的Isolate把发送器发给主Isolate
    sendPort.send(receivePort.sendPort);

    receivePort.listen((dynamic message) {
      if (message is int) {
        // 接收主Isolate发送过来的数据进行计算
        int total = message;
        int count = _performCompute(total);
        // 将计算结果发送给主Isolate
        sendPort.send(count);
      }
    });
  }
}
