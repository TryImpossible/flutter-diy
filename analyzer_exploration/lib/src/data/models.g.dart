// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:analyzer_exploration/src/data/models.dart';

class MyDataClassRepository {
  final _cache = <String, MyDataClass>{};

  MyDataClass? getById(String id) {
    return _cache[id];
  }

  void save(MyDataClass obj) {
    _cache[obj.id] = obj;
  }
}
