import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rust_plugin/rust_plugin.dart';

class RustFFIPage extends StatefulWidget {
  const RustFFIPage({super.key});

  @override
  State<RustFFIPage> createState() => _RustFFIPageState();
}

class _RustFFIPageState extends State<RustFFIPage> {

  String _helloResult = '';

  @override
  void initState() {
    super.initState();
    hello(name: "Jerry").then((String result) {
      setState(() {
        _helloResult = result;
      });
    });
  }

  @override
  void dispose() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RustFFI')),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text(
              'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
            ),
            Text(
              'Action: Call Rust `hello("Jerry")`\nResult: `$_helloResult`',
            ),
          ],
        ),
      ),
    );
  }
}

