import 'package:flutter/material.dart';

class HollowedTextPage extends StatelessWidget {
  const HollowedTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文字镂空效果')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HollowedText(text: 'Test', size: 100, color: Colors.orange[800]!),
            HollowedText(text: '空心字', size: 72, color: Colors.blue[800]!),
            HollowedText(text: 'Hello World', size: 120, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class HollowedText extends StatelessWidget {
  const HollowedText({
    super.key,
    required this.text,
    required this.color,
    required this.size,
  });

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = color,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: size, color: Colors.white),
        ),
      ],
    );
  }
}
