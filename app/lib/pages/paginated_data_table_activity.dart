import 'dart:math';

import 'package:flutter/material.dart';

class PaginatedDataTableActivity extends StatefulWidget {
  const PaginatedDataTableActivity({Key? key}) : super(key: key);

  @override
  _PaginatedDataTableActivityState createState() =>
      _PaginatedDataTableActivityState();
}

class _PaginatedDataTableActivityState
    extends State<PaginatedDataTableActivity> {
  SourceData _sourceData = SourceData();
  bool _sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable控件'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 12),
          PaginatedDataTable(
            header: Text('Flight Products'),
            showFirstLastButtons: true,
            sortAscending: _sortAscending,
            sortColumnIndex: 3,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
            columns: <DataColumn>[
              DataColumn(label: Text('Avatar')),
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(
                label: Text('Price'),
                onSort: (int columnIndex, bool ascending) {
                  if (columnIndex == 3) {
                    _sortAscending = ascending;
                    setState(() {});
                    _sourceData.sortByPrice(ascending);
                  }
                },
                tooltip: '点击排序',
              ),
              DataColumn(label: Text('No.')),
              DataColumn(
                label: Row(
                  children: [
                    Text('Address'),
                    SizedBox(width: 5.0),
                    Icon(Icons.home),
                  ],
                ),
              ),
            ],
            source: _sourceData,
            onSelectAll: (bool? value) {
              if (value != null) {
                print('onSelectAll is $value');
                _sourceData.selectAll(value);
              }
            },
            onPageChanged: (int value) {
              print('onPageChanged is $value');
            },
            checkboxHorizontalMargin: 12,
            horizontalMargin: 12,
            columnSpacing: 48,
            headingRowHeight: 56,
          ),
        ],
      ),
    );
  }
}

class SourceData extends DataTableSource {
  final List<Map<String, dynamic>> _sourceData = List.generate(
    200,
    (index) => {
      "avatar": (index % 3 == 1)
          ? 'assets/images/lufei.jpeg'
          : (index % 3 == 2)
              ? 'assets/images/suolong.jpeg'
              : 'assets/images/shanzhi.jpeg',
      "id": (index + 1),
      "name": "Name ${(index + 1)}",
      "price": Random().nextInt(10000),
      "no.": Random().nextInt(10000),
      "address": (index % 3 == 1)
          ? 'Beijing'
          : (index % 3 == 2)
              ? 'New York'
              : 'Los Angeles',
      'selected': false,
    },
  );

  void selectAll(bool value) {
    _sourceData.forEach((Map<String, dynamic> element) {
      element['selected'] = value;
    });
    notifyListeners();
  }

  void sortByPrice(bool ascending) {
    _sourceData.sort((Map<String, dynamic> m1, Map<String, dynamic> m2) {
      int result = (m1['price'] as int) - (m2['price'] as int);
      return ascending ? result : -result;
    });
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
      onSelectChanged: (bool? value) {
        if (value != null) {
          _sourceData[index]['selected'] = value;
          notifyListeners();
        }
      },
      selected: _sourceData[index]['selected'],
      cells: <DataCell>[
        DataCell(
          CircleAvatar(
            backgroundImage: AssetImage(_sourceData[index]["avatar"]),
          ),
          placeholder: true,
        ),
        DataCell(Text(_sourceData[index]['id'].toString())),
        DataCell(
          Text(_sourceData[index]['name']),
          showEditIcon: true,
          placeholder: true,
        ),
        DataCell(Text('\$ ${_sourceData[index]['price']}')),
        DataCell(Text(_sourceData[index]['no.'].toString())),
        DataCell(Text(_sourceData[index]['address'].toString()))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _sourceData.length;

  @override
  int get selectedRowCount => 0;
}
