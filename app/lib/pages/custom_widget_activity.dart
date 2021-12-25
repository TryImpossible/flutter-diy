import 'package:app/widget/custom_widget.dart';
import 'package:flutter/material.dart';

class CustomWidgetActivity extends StatefulWidget {
  const CustomWidgetActivity({Key? key}) : super(key: key);

  @override
  _CustomWidgetActivityState createState() => _CustomWidgetActivityState();
}

class _CustomWidgetActivityState extends State<CustomWidgetActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通过 RenderObject 自定义 Widget'),
      ),
      body: Container(
        color: Colors.black12,
        child: CustomWidget(),
      ),
    );
  }
}
