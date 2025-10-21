import 'package:flutter/material.dart';

import 'fortune_wheel_page.dart';
import 'skeleton_page.dart';
import 'splicing_image_page.dart';
import 'sqlite_ffi_page.dart';

class ThirdPartyWidgetPage extends StatefulWidget {
  const ThirdPartyWidgetPage({Key? key}) : super(key: key);

  @override
  State<ThirdPartyWidgetPage> createState() => _ThirdPartyWidgetPageState();
}

class _ThirdPartyWidgetPageState extends State<ThirdPartyWidgetPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _controller = ScrollController();
  final Map<String, Widget> _data = () {
    final Map<String, Widget> pages = <String, Widget>{
      '图片切割': const SplicingImagePage(),
      'SqliteFFI使用': const SqliteFFIPage(),
      '骨架屏': const SkeletonPage(),
      '幸运大转盘': const FortuneWheelPage(),
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
    // double value = 0.0;
    return Scaffold(
      // body: Center(
      //   child: StatefulBuilder(
      //     builder: (
      //       BuildContext context,
      //       StateSetter setState,
      //     ) {
      //       return Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           AnimatedContainer(
      //             duration: Duration.zero,
      //             width: 300,
      //             height: 300,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(150),
      //               gradient: LinearGradient(
      //                 begin: Alignment.bottomCenter,
      //                 end: Alignment.topCenter,
      //                 colors: const <Color>[Colors.red, Colors.white],
      //                 stops: <double>[value - 0.01, value],
      //               ),
      //               boxShadow: const <BoxShadow>[
      //                 BoxShadow(spreadRadius: 25, blurRadius: 25)
      //               ],
      //             ),
      //           ),
      //           TextButton(
      //             onPressed: () {
      //               setState(() {
      //                 value += 0.01;
      //               });
      //             },
      //             child: const Text('添加'),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),
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
        heroTag: "third_party_widget",
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
  }) : _data = data,
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
