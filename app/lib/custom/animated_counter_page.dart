import 'package:flutter/material.dart';

import 'app_animated_counter.dart';

class AnimatedCounterPage extends StatefulWidget {
  const AnimatedCounterPage({Key? key}) : super(key: key);

  @override
  State<AnimatedCounterPage> createState() => _AnimatedCounterPageState();
}

class _AnimatedCounterPageState extends State<AnimatedCounterPage> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCounter控件'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 120,
          color: Colors.blue,
          alignment: Alignment.center,
          child: AppAnimatedCounter(
            value: _value.toString(),
            textStyle: const TextStyle(fontSize: 100),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 44,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value--;
                      });
                    },
                    child: const Text('减1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value++;
                      });
                    },
                    child: const Text('加1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value -= 0.1;
                      });
                    },
                    child: const Text('减0.1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value += 0.1;
                      });
                    },
                    child: const Text('加0.1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value -= 10;
                      });
                    },
                    child: const Text('减10'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _value += 10;
                      });
                    },
                    child: const Text('加10'),
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
