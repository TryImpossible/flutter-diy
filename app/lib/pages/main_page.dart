import 'package:app/pages/dropdown_text_field_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Diy'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) {
                      return DropdownTextFieldPage();
                    },
                  ));
                },
                child: Text('下拉输入文本'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
