import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite_ffi/sqlite_ffi.dart' as sqliteffi;

class SqliteFFIPage extends StatefulWidget {
  const SqliteFFIPage({super.key});

  @override
  State<SqliteFFIPage> createState() => _SqliteFFIPageState();
}

class _SqliteFFIPageState extends State<SqliteFFIPage> {
  final _StudentSource _source = _StudentSource();

  @override
  void initState() {
    super.initState();
    _source.init();
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SqliteFFI')),
      body: PaginatedDataTable(
        header: const Text('Students'),
        showFirstLastButtons: true,
        showEmptyRows: true,
        rowsPerPage: 8,
        actions: <Widget>[
          IconButton(onPressed: _source.insert, icon: const Icon(Icons.add)),
          IconButton(onPressed: _source.delete, icon: const Icon(Icons.delete)),
        ],
        columns: <DataColumn>[
          const DataColumn(label: Text('ID')),
          const DataColumn(label: Text('Name')),
          const DataColumn(label: Text('Gender')),
          const DataColumn(label: Text('Age')),
        ],
        source: _source,
        onPageChanged: (int value) {
          debugPrint('onPageChanged is $value');
        },
      ),
    );
  }
}

class _StudentSource extends DataTableSource {
  List<Map<String, dynamic>> _data = <Map<String, dynamic>>[];
  late final sqliteffi.Database _database;

  Future<void> init() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String dbPath = path.join(directory.path, 'student.db');
    _database = sqliteffi.Database(dbPath);
    final String sql = '''
    CREATE TABLE IF NOT EXISTS student (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,                  
        gender CHAR(1) CHECK(gender IN ('男', '女')),
        age INTEGER CHECK(age >= 0 AND age <= 120)
    )
    ''';
    _database.execute(sql);
    _query();
  }

  void _query() {
    final String sql = '''
    SELECT * FROM student
    ''';
    final sqliteffi.Result result = _database.query(sql);
    _data = result
        .map(
          (row) => <String, dynamic>{
            'id': row['id'] as int,
            'name': row['name'] as String,
            'gender': row['gender'] as String,
            'age': row['age'] as int,
          },
        )
        .toList();
    notifyListeners();
  }

  void insert() {
    final String sql = '''
    INSERT INTO student (name, gender, age) VALUES
    ('张三', '男', 18),
    ('李四', '女', 19),
    ('王五', '男', 20),
    ('赵六', '女', 21);
    ''';
    _database.execute(sql);
    _query();
  }

  void delete() {
    final String sql = '''
    DELETE FROM student WHERE id = (SELECT MAX(id) FROM student)
    ''';
    _database.execute(sql);
    _query();
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(_data[index]['id'].toString())),
        DataCell(Text(_data[index]['name'])),
        DataCell(Text(_data[index]['gender'].toString())),
        DataCell(Text(_data[index]['age'].toString())),
      ],
    );
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
