import 'package:flutter/material.dart';
import 'package:flutter_diy/widget/single_line_fittedbox.dart';

class FittedBoxWidgetActivity extends StatelessWidget {
  const FittedBoxWidgetActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox控件'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _buildRow(' 90000000000000000 '),
            SingleLineFittedBox(child: _buildRow(' 90000000000000000 ')),
            _buildRow(' 800 '),
            SingleLineFittedBox(child: _buildRow(' 800 ')),
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRow(String text) {
    Widget child = Text(text);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
  }
}
