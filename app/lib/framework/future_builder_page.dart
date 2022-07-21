import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String> _mockNetworkData() {
    return Future.delayed(const Duration(seconds: 2), () => '模拟请求网络数据');
  }

  @override
  void initState() {
    super.initState();
    _mockNetworkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // 请求已结束
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text('Error: ${snapshot.error}');
              } else {
                // 请求成功，显示数据
                return Text('Contents: ${snapshot.data}');
              }
            } else {
              // 请求未结束，显示loadign
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
