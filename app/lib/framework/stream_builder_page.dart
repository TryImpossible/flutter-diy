import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  Stream<int> _counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i);
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
        title: const Text('StreamBuilder'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counter(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有Stream');
              case ConnectionState.waiting:
                return const Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return const Text('Stream 已关闭');
            }
          },
        ),
      ),
    );
  }
}
