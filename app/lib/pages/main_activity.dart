import 'package:app/pages/custom_widget_fragment.dart';
import 'package:app/pages/framework_widget_fragment.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  MainActivity({Key? key}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: MainBottomNavigationBar(
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        FrameworkWidgetFragment(),
        CustomWidgetFragment(),
      ],
    );
    // return IndexedStack(
    //   children: <Widget>[
    //     Offstage(
    //       offstage: _currentIndex != 0,
    //       child: FrameworkWidgetFragment(),
    //     ),
    //     Offstage(
    //       offstage: _currentIndex != 1,
    //       child: CustomWidgetFragment(),
    //     )
    //   ],
    // );
  }
}

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final ValueChanged<int>? onTap;

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.airplay),
          label: '系统组件',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: '自定义组件',
        ),
      ],
      onTap: (int index) {
        _currentIndex = index;
        setState(() {});
        widget.onTap?.call(index);
      },
    );
  }
}
