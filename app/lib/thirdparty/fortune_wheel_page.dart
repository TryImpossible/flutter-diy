import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math' as math;

class FortuneWheelPage extends StatefulWidget {
  const FortuneWheelPage({super.key});

  @override
  State<FortuneWheelPage> createState() => _FortuneWheelPageState();
}

class _FortuneWheelPageState extends State<FortuneWheelPage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Grogu',
      'Mace Windu',
      'Obi-Wan Kenobi',
      'Han Solo',
      'Luke Skywalker',
      'Darth Vader',
      'Yoda',
      'Ahsoka Tano',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('FortuneWheel')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(Fortune.randomInt(0, items.length));
          });
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: FortuneWheel(
              styleStrategy: AlternatingStyleStrategy(),
              animateFirst: false,
              // alignment: Alignment.center,
              indicators: [
                FortuneIndicator(
                  alignment: Alignment.topCenter, // <-- changing the position of the indicator
                  child: TriangleIndicator(
                    color: Colors.green, // <-- changing the color of the indicator
                    width: 20.0, // <-- changing the width of the indicator
                    height: 20.0, // <-- changing the height of the indicator
                    elevation: 0, // <-- changing the elevation of the indicator
                  ),
                ),
              ],
              selected: selected.stream,
              items: [
                for (var i = 0; i < items.length; i++)
                  FortuneItem(
                    style: FortuneItemStyle(
                      color: Colors.red.withAlpha((255 * 0.5).toInt()), // <-- custom circle slice fill color
                      borderColor: Colors.green, // <-- custom circle slice stroke color
                      borderWidth: 3, // <-- custom circle slice stroke width
                    ),
                    child: Transform.rotate(angle: i > (items.length / 2) ? math.pi : 0, child: Text(items[i])),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
