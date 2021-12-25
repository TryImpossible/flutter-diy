import 'package:app/pages/align_activity.dart';
import 'package:app/pages/button_bar_activity.dart';
import 'package:app/pages/clip_activity.dart';
import 'package:app/pages/draggable_scrollable_sheet_activity.dart';
import 'package:app/pages/expansion_panel_list_activity.dart';
import 'package:app/pages/fittedbox_activity.dart';
import 'package:app/pages/flow_activity.dart';
import 'package:app/pages/future_builder_activity.dart';
import 'package:app/pages/gridview/grid_view_activity.dart';
import 'package:app/pages/inherited_widget_activity.dart';
import 'package:app/pages/lificycle/lifecycle_page_activity.dart';
import 'package:app/pages/listview/list_view_activity.dart';
import 'package:app/pages/material_activity.dart';
import 'package:app/pages/my_provider/my_provider_activity.dart';
import 'package:app/pages/nested_scroll_view_activity.dart';
import 'package:app/pages/paginated_data_table_activity.dart';
import 'package:app/pages/sliver/sliver_activity.dart';
import 'package:app/pages/stream_builder_activity.dart';
import 'package:app/pages/toggle_buttons_activity.dart';
import 'package:app/pages/value_listenable_builder_activity.dart';
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
    'Material': MaterialActivity(),
    'ListView': ListViewActivity(),
    'GridView': GridViewActivity(),
    'Sliver': SliverActivity(),
    'NestedScrollView': NestedScrollViewActivity(),
    'ButtonBar': ButtonBarActivity(),
    'DraggableScrollableSheet': DraggableScrollableSheetActivity(),
    'ToggleButtons': ToggleButtonActivity(),
    'PaginatedDataTable': PaginatedDataTableActivity(),
    'ExpansionPanelList': ExpansionPanelListActivity(),
    'Flow': FlowActivity(),
    'Align': AlignActivity(),
    'Clip': ClipActivity(),
    'FittedBox': FittedBoxActivity(),
    'ValueListenableBuilder': ValueListenableBuilderActivity(),
    'FutureBuilder': FutureBuilderActivity(),
    'StreamBuilder': StreamBuilderActivity(),
    'InheritedWidget': InheritedWidgetActivity(),
    'MyProvider': MyProviderActivity(),
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
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return FittedBox(
                    child: ConstrainedBox(
                      constraints: constraints.copyWith(
                        maxHeight: double.infinity,
                      ),
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
