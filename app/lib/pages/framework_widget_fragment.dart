import 'package:app/pages/button_bar_widget_activity.dart';
import 'package:app/pages/draggable_scrollable_sheet_widget_activity.dart';
import 'package:app/pages/expansion_panel_list_widget_activity.dart';
import 'package:app/pages/flow_widget_activity.dart';
import 'package:app/pages/gridview/grid_view_widget_activity.dart';
import 'package:app/pages/lificycle/lifecycle_page_activity.dart';
import 'package:app/pages/listview/list_view_widget_activity.dart';
import 'package:app/pages/lificycle/stateful_parent_page_activity.dart';
import 'package:app/pages/material_widget_activity.dart';
import 'package:app/pages/nested_scroll_view_widget_activity.dart';
import 'package:app/pages/paginated_data_table_widget_activity.dart';
import 'package:app/pages/sliver/sliver_widget_activity.dart';
import 'package:app/pages/toggle_buttons_widget_activity.dart';
import 'package:flutter/material.dart';

class FrameworkWidgetFragment extends StatefulWidget {
  FrameworkWidgetFragment({Key? key}) : super(key: key);

  @override
  _FrameworkWidgetFragmentState createState() =>
      _FrameworkWidgetFragmentState();
}

class _FrameworkWidgetFragmentState extends State<FrameworkWidgetFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _topping() {}

  Map<String, Widget> _data = <String, Widget>{
    'Lifecycle': LifecyclePageActivity(),
    'Material控件': MaterialWidgetActivity(),
    'ListView系列控件': ListViewWidgetActivity(),
    'GridView系列控件': GridViewWidgetActivity(),
    'Sliver系列控件': SliverWidgetActivity(),
    'NestedScrollView控件': NestedScrollViewWidgetActivity(),
    'ButtonBar控件': ButtonBarWidgetActivity(),
    'DraggableScrollableSheet控件': DraggableScrollableSheetWidgetActivity(),
    'ToggleButtons控件': ToggleButtonWidgetActivity(),
    'PaginatedDataTable控件': PaginatedDataTableWidgetActivity(),
    'ExpansionPanelList控件': ExpansionPanelListWidgetActivity(),
    'Flow控件': FlowWidgetActivity(),
  };

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
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
        itemCount: _data.entries.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _topping,
        tooltip: 'topping',
        child: Icon(Icons.arrow_upward),
        heroTag: "framework_widget",
      ),
    );
  }
}
