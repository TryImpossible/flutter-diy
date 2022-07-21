import 'package:flutter/material.dart';

import 'stateless_child_page.dart';

class StatelessParentPage extends StatelessWidget {
  StatelessParentPage({Key? key}) : super(key: key) {
    debugPrint('无状态父页面---constructor');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('无状态父页面---build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('无状态父页面'),
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
              child: const Text('子页面'),
            ),
          ],
        ),
      ),
    );
  }
}
