import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatermarkEffectPage extends StatefulWidget {
  const WatermarkEffectPage({super.key});

  @override
  State<WatermarkEffectPage> createState() => _WatermarkEffectPageState();
}

class _WatermarkEffectPageState extends State<WatermarkEffectPage> {
  String? watermark;

  @override
  Widget build(BuildContext context) {
    watermark = '比如说 文字比较长的话 就会比较小';
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('水印效果')),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 280, child: _buildItem()),
          SizedBox(
            height: 300,
            child: Row(
              children: <Widget>[
                Expanded(child: _buildItem()),
                Expanded(child: _buildItem()),
              ],
            ),
          ),
          SizedBox(height: 220, child: _buildItem()),
        ],
      ),
    );
  }

  Widget _buildItem() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CupertinoPopupSurface(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: watermark != null ? 2 : 0,
                sigmaY: watermark != null ? 2 : 0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: FlutterLogo(style: FlutterLogoStyle.horizontal),
              ),
            ),
          ),
        ),
        if (watermark != null)
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Transform.rotate(
                angle: -pi / 4,
                child: FittedBox(child: Material(child: Text(watermark!))),
              ),
            ),
          ),
      ],
    );
  }
}
