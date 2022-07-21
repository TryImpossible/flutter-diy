import 'package:flutter/material.dart';

class ShaderMaskPage extends StatelessWidget {
  ShaderMaskPage({Key? key}) : super(key: key);

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
    // CustomSingleChildLayout
    // CustomMultiChildLayout
    const Text text = Text(
      '隐约雷鸣，阴霾天空，但盼风雨来，能留你在此；隐约雷鸣，阴霾天空，即使天无雨，我亦留此地。',
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShaderMask'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.blue, Colors.green],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: text,
            ),
          ),
          SliverToBoxAdapter(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: <Color>[Colors.blue, Colors.green],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: text,
            ),
          ),
          SliverToBoxAdapter(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const SweepGradient(
                  center: Alignment.center,
                  colors: <Color>[Colors.blue, Colors.green],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: text,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            children: _blendMode.map((BlendMode mode) {
              return GridTile(
                footer: Text(
                  mode.toString().replaceAll('BlendMode.', ''),
                  textAlign: TextAlign.center,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black, Colors.white],
                    ).createShader(bounds);
                  },
                  blendMode: mode,
                  child: Image.asset("assets/images/lufei.jpeg"),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
