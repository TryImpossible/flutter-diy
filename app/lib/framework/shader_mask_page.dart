import 'package:flutter/material.dart';

class ShaderMaskPage extends StatelessWidget {
  const ShaderMaskPage({Key? key}) : super(key: key);

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
            children: BlendMode.values.map((BlendMode mode) {
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
