import 'package:app/pages/custom_widgets/gradient_button_activity.dart';
import 'package:app/pages/custom_widgets/turn_box_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidgetsActivity extends StatefulWidget {
  const CustomWidgetsActivity({Key? key}) : super(key: key);

  @override
  _CustomWidgetsActivityState createState() => _CustomWidgetsActivityState();
}

class _CustomWidgetsActivityState extends State<CustomWidgetsActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return GradientButtonActivity();
                  },
                ));
              },
              child: Text('GradientButton'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return TurnBoxActivity();
                  },
                ));
              },
              child: Text('TurnBox'),
            ),
          ],
        ),
      ),
    );
  }
}
