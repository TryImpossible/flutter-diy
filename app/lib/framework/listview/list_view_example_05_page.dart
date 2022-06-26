import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';

class ListViewExample05Page extends StatefulWidget {
  const ListViewExample05Page({Key? key}) : super(key: key);

  @override
  _ListViewExample05PageState createState() =>
      _ListViewExample05PageState();
}

class _ListViewExample05PageState extends State<ListViewExample05Page> {
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();
  List<Color> _list = List.from(Colors.primaries);

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
        _list.addAll(Colors.primaries);
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

  String _generateMd5(String data) {
    Uint8List content = Utf8Encoder().convert(data);
    Digest digest = md5.convert(content);
    return digest.toString();
  }

  Widget _buildItem(int index) {
    //反复迭代计算MD5
    String str = '1234567890abcdefghijklmnopqrstuvwxyz';
    for (int i = 0; i < 10000; i++) {
      str = _generateMd5(str);
    }
    return Container(
      color: _list[index],
      alignment: Alignment.center,
      height: 100,
      child: Text(
        // index.toString(),
        str,
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
