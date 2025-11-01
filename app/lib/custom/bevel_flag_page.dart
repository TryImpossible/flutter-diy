import 'dart:math';

import 'package:flutter/material.dart';

class BevelFlagPage extends StatelessWidget {
  const BevelFlagPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 64, w = 280;
    return Scaffold(
      appBar: AppBar(title: Text('斜角旗帜')),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(width: 320, height: 320, color: Colors.grey),
            Positioned(
              right: 0,
              top: sqrt(w * w / 2 - sqrt2 * w * h + h * h),
              child: Transform.rotate(
                alignment: Alignment.bottomRight,
                angle: pi / 4,
                child: Container(
                  width: w,
                  height: h,
                  color: Colors.red.withAlpha((255.0 * 0.8).round()),
                  alignment: Alignment.center,
                  child: Text(
                    '斜角旗帜',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
