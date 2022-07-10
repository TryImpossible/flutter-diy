import 'package:flutter/material.dart';

class AnimatedWidgetsPage extends StatefulWidget {
  @override
  _AnimatedWidgetsPageState createState() => _AnimatedWidgetsPageState();
}

class _AnimatedWidgetsPageState extends State<AnimatedWidgetsPage> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _progress = 0.3;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 2);
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
                child: Text("AnimatedPadding"),
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
                      child: Text("AnimatedPositioned"),
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
                  child: Text("AnimatedAlign"),
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
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration,
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
                    colors: <Color>[Colors.red, Colors.white],
                    stops: <double>[_progress, _progress],
                  ),
                  boxShadow: [BoxShadow(spreadRadius: 10, blurRadius: 10)],
                ),
              ),
            ),
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
