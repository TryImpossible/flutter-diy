import 'package:app/global.dart';
import 'package:flutter/material.dart';

class ListViewExample05Fragment extends StatefulWidget {
  const ListViewExample05Fragment({Key? key}) : super(key: key);

  @override
  _ListViewExample05FragmentState createState() =>
      _ListViewExample05FragmentState();
}

class _ListViewExample05FragmentState extends State<ListViewExample05Fragment> {
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();
  List<Color> _list = List.from(colorList);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!_isLoading &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        this._isLoading = true;
        loadMore();
        setState(() {});
      }
    });
  }

  Future<void> loadMore() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
        _list.addAll(colorList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        itemCount: _list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < _list.length) {
            return _buildItem(index);
          } else {
            return _buildLoading();
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: .5, color: Color(0xFFDDDDDD));
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      color: _list[index],
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Text(
        index.toString(),
        style: TextStyle(
          fontSize: 21,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    if (_isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }
}
