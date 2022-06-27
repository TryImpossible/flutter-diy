import 'package:flutter/material.dart';

class AnimatedCounterPage extends StatefulWidget {
  const AnimatedCounterPage({Key? key}) : super(key: key);

  @override
  State<AnimatedCounterPage> createState() => _AnimatedCounterPageState();
}

class _AnimatedCounterPageState extends State<AnimatedCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCounter控件'),
      ),
    );
  }
}
