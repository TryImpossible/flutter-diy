import 'package:app/custom/app_animated_counter.dart';
import 'package:flutter/material.dart';

class AnimatedCounterPage extends StatefulWidget {
  const AnimatedCounterPage({Key? key}) : super(key: key);

  @override
  State<AnimatedCounterPage> createState() => _AnimatedCounterPageState();
}

class _AnimatedCounterPageState extends State<AnimatedCounterPage> {
  double _count = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCounter控件'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Row(
            children: _count.toString().split('').map((String item) {
              if (RegExp(r'\d').hasMatch(item)) {
                return Expanded(
                  child: AppAnimatedCounter(
                    duration: const Duration(milliseconds: 500),
                    value: int.tryParse(item) ?? 0,
                  ),
                );
              } else {
                return Text(
                  item,
                  style: TextStyle(fontSize: 100),
                  textAlign: TextAlign.center,
                );
              }
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 44,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count -= 10;
                      });
                    },
                    child: Text('减10'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count--;
                      });
                    },
                    child: Text('减1'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count++;
                      });
                    },
                    child: Text('加1'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count += 10;
                      });
                    },
                    child: Text('加10'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
