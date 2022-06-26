import 'package:flutter/material.dart';

class StatelessChildPage extends StatelessWidget {
  StatelessChildPage({Key? key}) : super(key: key) {
    print('无状态子页面---constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('无状态子页面---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('无状态子页面'),
      ),
    );
  }
}
