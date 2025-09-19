import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// 由于很多同学说没有跳转动画，这里是因为之前exmaple里面用的是 [PageRouteBuilder]，
  /// 其实这里是可以自定义的，和Boost没太多关系，比如我想用类似iOS平台的动画，
  /// 那么只需要像下面这样写成 [CupertinoPageRoute] 即可
  /// (这里全写成[MaterialPageRoute]也行，这里只不过用[CupertinoPageRoute]举例子)
  ///
  /// 注意，如果需要push的时候，两个页面都需要动的话，
  /// （就是像iOS native那样，在push的时候，前面一个页面也会向左推一段距离）
  /// 那么前后两个页面都必须是遵循CupertinoRouteTransitionMixin的路由
  /// 简单来说，就两个页面都是CupertinoPageRoute就好
  /// 如果用MaterialPageRoute的话同理

  Map<String, FlutterBoostRouteFactory> routerMap = {
    '/main-page': (RouteSettings settings, String? uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          Map<String, dynamic>? map = settings.arguments as Map<String, dynamic>?;
          String? data = map?['data'] as String?;
          return MainPage(data: data);
        },
      );
    },
    '/simple-page': (RouteSettings settings, String? uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          String data = map['data'] as String;
          return SimplePage(data: data);
        },
      );
    },
  };

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    if (settings.name == null || !routerMap.containsKey(settings.name)) {
      return null;
    }
    FlutterBoostRouteFactory func = routerMap[settings.name] as FlutterBoostRouteFactory;
    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: home,
      debugShowCheckedModeBanner: true,

      ///必须加上builder参数，否则showDialog等会出问题
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory, appBuilder: appBuilder, initialRoute: '/main-page');
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.data});

  final String? data;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        BoostNavigator.instance.pop({'data': 'Flutter回复数据给原生'});
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  BoostNavigator.instance.pop({'data': 'Flutter回复数据给原生'});
                },
                child: const Text('Main Page'),
              ),
              Text('$data'),
              ElevatedButton(
                onPressed: () {
                  BoostNavigator.instance.push('/native-page', arguments: {'data': '来自Flutter的数据'}).then((data) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data.toString())));
                  });
                },
                child: const Text('跳转原生页面'),
              ),
              ElevatedButton(
                onPressed: () {
                  BoostNavigator.instance.push('/simple-page', arguments: {'data': 'data'});
                },
                child: const Text('跳转Flutter页面'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  const SimplePage({super.key, required Object data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('SimplePage')),
    );
  }
}
