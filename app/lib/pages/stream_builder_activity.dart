import 'package:flutter/material.dart';

class StreamBuilderActivity extends StatefulWidget {
  const StreamBuilderActivity({Key? key}) : super(key: key);

  @override
  _StreamBuilderActivityState createState() =>
      _StreamBuilderActivityState();
}

class _StreamBuilderActivityState
    extends State<StreamBuilderActivity> {
  Stream<int> _counter() {
    return Stream.periodic(Duration(seconds: 1), (i) => i);
  }

  @override
  void initState() {
    super.initState();
    _counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counter(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream 已关闭');
            }
          },
        ),
      ),
    );
  }
}
