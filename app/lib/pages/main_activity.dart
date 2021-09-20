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
  int _currentIndex = 0;

  void _topping() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
  }

  Widget _buildBottomNavigationBar() {
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
        _pageController.jumpToPage(index);
        _currentIndex = index;
        setState(() {});
      },
    );
  }
}
