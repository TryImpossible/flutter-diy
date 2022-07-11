import 'package:app/custom/animated_counter_page.dart';
import 'package:flutter/material.dart';

import 'custom_render_object_widget_page.dart';
import 'dropdown_text_field_page.dart';
import 'gradient_button_page.dart';
import 'my_provider/my_provider_page.dart';
import 'shadow_box_page.dart';
import 'turn_box_page.dart';

class CustomWidgetPage extends StatefulWidget {
  CustomWidgetPage({Key? key}) : super(key: key);

  @override
  _CustomWidgetPageState createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _controller = ScrollController();
  final Map<String, Widget> _data = () {
    final Map<String, Widget> pages = <String, Widget>{
      '下拉输入文本': DropdownTextFieldPage(),
      '通过 RenderObject 自定义 Widget': CustomRenderObjectWidgetPage(),
      'MyProvider': MyProviderPage(),
      'GradientButton': GradientButtonPage(),
      'TurnBox': TurnBoxPage(),
      'AnimatedCounter': AnimatedCounterPage(),
      'ShadowBox': ShadowBoxPage(),
    };
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
        child: Icon(Icons.arrow_upward),
        heroTag: "custom_widget",
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
