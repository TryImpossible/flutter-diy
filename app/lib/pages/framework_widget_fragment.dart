import 'package:app/global.dart';
import 'package:app/pages/button_bar_widget_activity.dart';
import 'package:app/pages/gridview/grid_view_widget_activity.dart';
import 'package:app/pages/listview/list_view_widget_activity.dart';
import 'package:app/pages/material_widget_activity.dart';
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

  Map<String, Widget> _data = <String, Widget>{
    'Material控件': MaterialWidgetActivity(),
    'ListView系列控件': ListViewWidgetActivity(),
    'GridView系列控件': GridViewWidgetActivity(),
    'Sliver系列控件': SliverWidgetActivity(),
    'ButtonBar控件': ButtonBarWidgetActivity(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return _data.values.elementAt(index);
                    },
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                color: randomColor,
                child: Text(
                  _data.keys.elementAt(index),
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          itemCount: _data.entries.length),
      floatingActionButton: FloatingActionButton(
        onPressed: _topping,
        tooltip: 'topping',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
