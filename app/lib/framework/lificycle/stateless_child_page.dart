import 'package:flutter/material.dart';

class StatelessChildPage extends StatelessWidget {
  StatelessChildPage({Key? key}) : super(key: key) {
    debugPrint('无状态子页面---constructor');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('无状态子页面---build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('无状态子页面'),
      ),
    );
  }
}
