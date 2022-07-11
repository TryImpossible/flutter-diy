import 'package:flutter/material.dart';

import 'button_bar_page.dart';
import 'clip_page.dart';
import 'color_filtered_page.dart';
import 'custom_multi_child_layout_page.dart';
import 'custom_single_child_layout_page.dart';
import 'draggable_scrollable_sheet_page.dart';
import 'expansion_panel_list_page.dart';
import 'fittedbox_page.dart';
import 'flow_page.dart';
import 'future_builder_page.dart';
import 'gesture_page.dart';
import 'inherited_widget_page.dart';
import 'isolate_compute_page.dart';
import 'lificycle/lifecycle_page.dart';
import 'listener_page.dart';
import 'listview/list_view_page.dart';
import 'material_widget_page.dart';
import 'paginated_data_table_page.dart';
import 'shader_mask_page.dart';
import 'sliver/sliver_page.dart';
import 'sliver_layout_builder_page.dart';
import 'stateful_builder_page.dart';
import 'stream_builder_page.dart';
import 'toggle_buttons_page.dart';
import 'value_listenable_builder_page.dart';
import 'align_page.dart';
import 'animation/animation_page.dart';
import 'gridview/grid_view_page.dart';

class FrameworkWidgetPage extends StatelessWidget {
  FrameworkWidgetPage({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();
  final Map<String, Widget> _data = () {
    final Map<String, Widget> pages = <String, Widget>{
      'Lifecycle': LifecyclePage(),
      'Material': MaterialWidgetPage(),
      'ListView': ListViewPage(),
      'GridView': GridViewPage(),
      'Sliver': SliverPage(),
      'ButtonBar': ButtonBarPage(),
      'DraggableScrollableSheet': DraggableScrollableSheetPage(),
      'ToggleButtons': ToggleButtonPage(),
      'PaginatedDataTable': PaginatedDataTablePage(),
      'ExpansionPanelList': ExpansionPanelListPage(),
      'Flow': FlowPage(),
      'Align': AlignPage(),
      'Clip': ClipPage(),
      'FittedBox': FittedBoxPage(),
      'ValueListenableBuilder': ValueListenableBuilderPage(),
      'FutureBuilder': FutureBuilderPage(),
      'StreamBuilder': StreamBuilderPage(),
      'IsolateCompute': IsolateComputePage(),
      'InheritedWidget': InheritedWidgetPage(),
      'Listener': ListenerPage(),
      'Gesture': GesturePage(),
      'Animation': AnimationPage(),
      'ColorFiltered': ColorFilteredPage(),
      'ShaderMask': ShaderMaskPage(),
      'StatefulBuilder': StatefulBuilderPage(),
      'SliverLayoutBuilder': SliverLayoutBuilderPage(),
      'CustomSingleChildLayout': CustomSingleChildLayoutPage(),
      'CustomMultiChildLayout': CustomMultiChildLayoutPage(),
    };
    return Map<String, Widget>.fromIterable(
      List.from(pages.keys)..sort(),
      key: (dynamic item) => item,
      value: (dynamic item) => pages[item]!,
    );
  }();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _controller,
        itemCount: _data.entries.length,
        itemBuilder: (BuildContext context, int index) {
          return _ListItem(data: _data, index: index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateTo(
            0,
            duration: kThemeAnimationDuration,
            curve: Curves.linear,
          );
        },
        tooltip: 'topping',
        child: Icon(Icons.arrow_upward),
        heroTag: "framework_widget",
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required Map<String, Widget> data,
    required int index,
  })  : _data = data,
        _index = index,
        super(key: key);

  final Map<String, Widget> _data;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[_index % Colors.primaries.length],
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return _data.values.elementAt(_index);
              },
            ),
          );
        },
        title: Text(
          _data.keys.elementAt(_index),
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
