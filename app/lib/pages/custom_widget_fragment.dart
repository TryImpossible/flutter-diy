import 'package:app/pages/custom_widget_activity.dart';
import 'package:app/pages/dropdown_text_field_activity.dart';
import 'package:flutter/material.dart';

class CustomWidgetFragment extends StatefulWidget {
  CustomWidgetFragment({Key? key}) : super(key: key);

  @override
  _CustomWidgetFragmentState createState() => _CustomWidgetFragmentState();
}

class _CustomWidgetFragmentState extends State<CustomWidgetFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _topping() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top),
              _buildItem('下拉输入文本', DropdownTextFieldActivity()),
              _buildItem('通过 RenderObject 自定义 Widget', CustomWidgetActivity()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _topping,
        tooltip: 'topping',
        child: Icon(Icons.arrow_upward),
        heroTag: "custom_widget",
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
