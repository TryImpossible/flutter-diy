import 'package:flutter/material.dart';

import 'paint_page.dart';
import 'scratch_ticket_page.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomPaint')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PaintPage();
                    },
                  ));
                },
                child: Text('Paint使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ScratchTicketPage();
                    },
                  ));
                },
                child: Text('刮奖票'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
