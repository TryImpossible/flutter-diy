import 'package:flutter/material.dart';

class ListViewExample06Fragment extends StatefulWidget {
  const ListViewExample06Fragment({Key? key}) : super(key: key);

  @override
  _ListViewExample06FragmentState createState() =>
      _ListViewExample06FragmentState();
}

class _ListViewExample06FragmentState extends State<ListViewExample06Fragment>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final List<UserBean> _animatedList = [
    UserBean('路飞', 'assets/images/lufei.jpeg'),
    UserBean('索隆', 'assets/images/suolong.jpeg'),
    UserBean('山治', 'assets/images/shanzhi.jpeg'),
    UserBean('艾斯', 'assets/images/aisi.jpeg'),
    UserBean('罗', 'assets/images/luo.jpeg'),
    UserBean('鸣人', 'assets/images/mingren.jpeg'),
  ];

  final _addItem = UserBean('Add Item', 'assets/images/lufei.jpeg');

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: AnimatedList(
        key: _key,
        initialItemCount: _animatedList.length,
        itemBuilder: (
          BuildContext context,
          int index,
          Animation<double> animation,
        ) {
          return _buildItemWithSlideSizeFade(
              index, _animatedList[index], animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertItem(_animatedList.length, _addItem);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildItemWithFade(
    int index,
    UserBean user,
    Animation<double> animation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: _buildItem(index, user),
    );
  }

  // Widget _buildItemWithSlide(
  //   int index,
  //   UserBean user,
  //   Animation<double> animation,
  // ) {
  //   return SlideTransition(
  //     position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
  //         .animate(animation),
  //     child: _buildItem(index, user),
  //   );
  // }

  Widget _buildItemWithSlideSizeFade(
    int index,
    UserBean user,
    Animation<double> animation,
  ) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
          .animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: _buildItem(index, user),
        ),
      ),
    );
  }

  Widget _buildItem(int index, UserBean user) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      child: Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage(user.avatar)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.clear),
            onTap: () {
              _removeItem(index);
            },
          ),
        ],
      ),
    );
  }

  // GlobalKey 方式
  void _insertItem(int index, UserBean item) {
    _animatedList.insert(index, item);
    _key.currentState?.insertItem(index);
  }

  void _removeItem(int index) {
    UserBean user = _animatedList.removeAt(index);
    _key.currentState?.removeItem(
      index,
      (BuildContext context, Animation<double> animation) =>
          _buildItemWithFade(index, user, animation),
    );
  }
}

class UserBean {
  String name;
  String avatar;

  UserBean(this.name, this.avatar);
}
