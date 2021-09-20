import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Color> colorList = <Color>[
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.cyan,
  Colors.blue,
  Colors.purple,
];

/// 随机颜色
Color get randomColor => Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
