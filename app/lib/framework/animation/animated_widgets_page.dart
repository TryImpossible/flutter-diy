import 'package:flutter/material.dart';

class AnimatedWidgetsPage extends StatefulWidget {
  const AnimatedWidgetsPage({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetsPage> createState() => _AnimatedWidgetsPageState();
}

class _AnimatedWidgetsPageState extends State<AnimatedWidgetsPage> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = const TextStyle(color: Colors.black);
  final Color _decorationColor = Colors.blue;
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(seconds: 2);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padding = 20;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: const Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _left = 100;
                        });
                      },
                      child: const Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _align = Alignment.center;
                    });
                  },
                  child: const Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _height = 150;
                    _color = Colors.blue;
                  });
                },
                child: const Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              style: _style,
              duration: duration,
              child: GestureDetector(
                child: const Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = const TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
            ),
            // AnimatedDecoratedBox(
            //   duration: duration,
            //   decoration: BoxDecoration(color: _decorationColor),
            //   child: TextButton(
            //     onPressed: () {
            //       setState(() {
            //         _decorationColor = Colors.red;
            //       });
            //     },
            //     child: Text(
            //       "AnimatedDecoratedBox",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                setState(() => _progress += 0.03);
              },
              child: AnimatedContainer(
                duration: Duration.zero,
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: const <Color>[Colors.red, Colors.white],
                    stops: <double>[_progress, _progress],
                  ),
                  boxShadow: const [
                    BoxShadow(spreadRadius: 10, blurRadius: 10)
                  ],
                ),
              ),
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
