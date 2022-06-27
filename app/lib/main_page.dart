import 'package:app/custom/app_keep_alive_wrapper.dart';
import 'package:app/custom/custom_widget_page.dart';
import 'package:app/framework/framework_widget_page.dart';
import 'package:app/thirdparty/third_party_widget_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _MainBottomNavigationBar(
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
        AppKeepAliveWrapper(child: FrameworkWidgetPage()),
        ThirdPartyWidgetPage(),
        CustomWidgetPage(),
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

class _MainBottomNavigationBar extends StatefulWidget {
  const _MainBottomNavigationBar({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final ValueChanged<int>? onTap;

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<_MainBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: '框架组件',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active),
          label: '第三方组件',
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
