import 'package:flutter/material.dart';

import 'stateless_child_page.dart';

class StatelessParentPage extends StatelessWidget {
  StatelessParentPage({Key? key}) : super(key: key) {
    print('无状态父页面---constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('无状态父页面---build');
    return Scaffold(
      appBar: AppBar(
        title: Text('无状态父页面'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return StatelessChildPage();
                    },
                  ),
                );
              },
              child: Text('子页面'),
            ),
          ],
        ),
      ),
    );
  }
}