import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> tabs = <String, Widget>{
      '示例1': const _SkeletonExample1(),
      '示例2': const _SkeletonExample2(),
    };
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('骨架屏示例'),
          bottom: TabBar(
            tabs: tabs.keys.map((String title) {
              return Tab(text: title);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.values.map((Widget widget) {
            return Center(child: widget);
          }).toList(),
        ),
      ),
    );
  }
}

class _SkeletonExample1 extends StatefulWidget {
  const _SkeletonExample1({super.key});

  @override
  State<_SkeletonExample1> createState() => _SkeletonExample1State();
}

class _SkeletonExample1State extends State<_SkeletonExample1> {
  bool _loading = true;

  Future<void> _onRefresh() async {
    setState(() {
      _loading = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: <Widget>[
          Skeletonizer.sliver(
            enabled: _loading,
            justifyMultiLineText: false,
            textBoneBorderRadius: TextBoneBorderRadius.fromHeightFactor(.5),
            ignoreContainers: true,
            child: SliverList.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Item number $index as title'),
                    subtitle: const Text('Subtitle here'),
                    trailing: const Icon(Icons.ac_unit),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _User {
  final String name;
  final String jobTitle;
  final String avatar;
  final String createdAt;

  _User({
    required this.name,
    required this.jobTitle,
    required this.avatar,
    required this.createdAt,
  });
}

class _SkeletonExample2 extends StatefulWidget {
  const _SkeletonExample2({super.key});

  @override
  State<_SkeletonExample2> createState() => _SkeletonExample2State();
}

class _SkeletonExample2State extends State<_SkeletonExample2> {
  bool _loading = true;
  List<_User> _users = <_User>[];

  Future<void> _onRefresh() async {
    setState(() {
      _loading = true;
      _users = List.filled(
        7,
        _User(
          name: BoneMock.name,
          jobTitle: BoneMock.words(2),
          avatar: BoneMock.email,
          createdAt: BoneMock.date,
        ),
      );
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
        _users = List.filled(
          7,
          _User(
            name: 'User name',
            jobTitle: 'Developer',
            avatar: 'assets/images/lufei.jpeg',
            createdAt: DateTime.timestamp().toString(),
          ),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Skeletonizer(
        enabled: _loading,
        effect: SoldColorEffect(color: Colors.grey[300]!),
        child: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_users[index].name),
                subtitle: Text(_users[index].jobTitle),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(_users[index].avatar),
                ),
                trailing: Skeleton.replace(
                  width: 50,
                  height: 50,
                  replacement: Container(color: Colors.redAccent),
                  child: Icon(Icons.ac_unit, size: 40),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
