import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderActivity extends StatefulWidget {
  const ValueListenableBuilderActivity({Key? key}) : super(key: key);

  @override
  _ValueListenableBuilderActivityState createState() =>
      _ValueListenableBuilderActivityState();
}

class _ValueListenableBuilderActivityState
    extends State<ValueListenableBuilderActivity> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableBuilder'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次', textScaleFactor: textScaleFactor),
              ],
            );
          },
          child: const Text('点击了 ', textScaleFactor: textScaleFactor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}