import 'package:app/custom/animated_counter_page.dart';
import 'package:app/custom/app_refresh_indicator_page.dart';
import 'package:app/custom/render_object_button.dart';
import 'package:flutter/material.dart';

import 'app_bubble_page.dart';
import 'app_scroll_opacity.dart';
import 'dropdown_text_field_page.dart';
import 'editing_history_page.dart';
import 'gradient_button_page.dart';
import 'my_provider/my_provider_page.dart';
import 'shadow_box_page.dart';
import 'sliver_flexible_header_page.dart';
import 'sliver_persistent_header_to_box_page.dart';
import 'touch_height_light_page.dart';
import 'turn_box_page.dart';

class CustomWidgetPage extends StatefulWidget {
  const CustomWidgetPage({Key? key}) : super(key: key);

  @override
  State<CustomWidgetPage> createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _controller = ScrollController();
  final Map<String, Widget> _data = () {
    final Map<String, Widget> pages = <String, Widget>{
      '下拉输入文本': const DropdownTextFieldPage(),
      'RenderObjectButton': const RenderObjectButtonPage(),
      'MyProvider': const MyProviderPage(),
      'GradientButton': const GradientButtonPage(),
      'TurnBox': const TurnBoxPage(),
      'AnimatedCounter': const AnimatedCounterPage(),
      'ShadowBox': const ShadowBoxPage(),
      'AppBubble': const AppBubblePage(),
      'AppRefreshIndicator': const AppRefreshIndicatorPage(),
      'AppScrollOpacity': const AppScrollOpacityPage(),
      'TouchHeightLight': const TouchHeightLightPage(),
      'EditingHistory': const EditingHistoryPage(),
      'SliverFlexibleHeader': const SliverFlexibleHeaderPage(),
      'SliverPersistentHeaderToBox': const SliverPersistentHeaderToBoxPage(),
    };
    // ignore: prefer_for_elements_to_map_fromIterable
    return Map<String, Widget>.fromIterable(
      List.from(pages.keys)..sort(),
      key: (dynamic item) => item,
      value: (dynamic item) => pages[item]!,
    );
  }();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        heroTag: "custom_widget",
        child: const Icon(Icons.arrow_upward),
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
