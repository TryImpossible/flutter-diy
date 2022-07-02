import 'package:flutter/material.dart';

class ColorFilteredPage extends StatelessWidget {
  ColorFilteredPage({Key? key}) : super(key: key);

  final List<BlendMode> _blendMode = [
    BlendMode.clear,
    BlendMode.src,
    BlendMode.dst,
    BlendMode.srcOver,
    BlendMode.dstOver,
    BlendMode.srcIn,
    BlendMode.dstIn,
    BlendMode.srcOut,
    BlendMode.dstOut,
    BlendMode.srcATop,
    BlendMode.dstATop,
    BlendMode.xor,
    BlendMode.plus,
    BlendMode.modulate,
    BlendMode.screen,
    BlendMode.overlay,
    BlendMode.darken,
    BlendMode.lighten,
    BlendMode.colorDodge,
    BlendMode.colorBurn,
    BlendMode.hardLight,
    BlendMode.softLight,
    BlendMode.difference,
    BlendMode.exclusion,
    BlendMode.multiply,
    BlendMode.hue,
    BlendMode.saturation,
    BlendMode.color,
    BlendMode.luminosity,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorFiltered'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: _blendMode.map((BlendMode mode) {
          return GridTile(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.orangeAccent, mode),
              child: FlutterLogo(),
            ),
            // child: Image.asset(
            //   "assets/images/lufei.jpeg",
            //   color: Colors.amber,
            //   colorBlendMode: mode,
            // ),
            footer: Text(
              mode.toString().replaceAll('BlendMode.', ''),
              textAlign: TextAlign.center,
            ),
          );
        }).toList(),
      ),
    );
  }
}
