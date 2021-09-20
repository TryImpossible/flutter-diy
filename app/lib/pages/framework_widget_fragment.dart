import 'package:app/pages/listview/list_view_widget_activity.dart';
import 'package:app/pages/sliver/sliver_widget_activity.dart';
import 'package:flutter/material.dart';

class FrameworkWidgetFragment extends StatefulWidget {
  FrameworkWidgetFragment({Key? key}) : super(key: key);

  @override
  _FrameworkWidgetFragmentState createState() =>
      _FrameworkWidgetFragmentState();
}

class _FrameworkWidgetFragmentState extends State<FrameworkWidgetFragment> {
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
              _buildItem('ListView系列控件', ListViewWidgetActivity()),
              _buildItem('Sliver系列控件', SliverWidgetActivity()),
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
