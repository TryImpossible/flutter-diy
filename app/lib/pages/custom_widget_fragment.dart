import 'package:app/pages/dropdown_text_field_activity.dart';
import 'package:flutter/material.dart';

class CustomWidgetFragment extends StatefulWidget {
  CustomWidgetFragment({Key? key}) : super(key: key);

  @override
  _CustomWidgetFragmentState createState() => _CustomWidgetFragmentState();
}

class _CustomWidgetFragmentState extends State<CustomWidgetFragment> {
  void _topping() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top),
              _buildItem('下拉输入文本', DropdownTextFieldActivity()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _topping,
        tooltip: 'topping',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  Widget _buildItem(String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return page;
            },
          ),
        );
      },
      child: Text(title),
    );
  }
}
