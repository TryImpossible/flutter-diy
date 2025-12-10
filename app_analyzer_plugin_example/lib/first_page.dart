import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: const Text('HMHMFirstPage')),
    // );
    const String name = 'name';
    return Container(
      child: Container(
        child: Image.asset('name'),
      ),
    );
  }
}
