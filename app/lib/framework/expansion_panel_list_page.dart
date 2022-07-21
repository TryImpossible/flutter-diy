import 'package:flutter/material.dart';

class ExpansionPanelListPage extends StatefulWidget {
  const ExpansionPanelListPage({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListPage> createState() => _ExpansionPanelListPageState();
}

class _ExpansionPanelListPageState extends State<ExpansionPanelListPage> {
  final List<ExpandBean> _data = List.generate(20, (int index) {
    return ExpandBean('标题$index', List.filled(50, '内容'), false);
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpansionPanelList控件'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          elevation: 0,
          expansionCallback: (int panelIndex, bool isExpanded) {
            debugPrint('isExpanded is $isExpanded');
            _data[panelIndex].isExpanded = !_data[panelIndex].isExpanded;
            setState(() {});
          },
          children: _data.map((ExpandBean data) {
            return ExpansionPanel(
              // backgroundColor: Colors.grey.shade50,
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  margin: const EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: Text(data.title),
                );
              },
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.content.map((String e) => Text(e)).toList(),
                ),
              ),
              isExpanded: data.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandBean {
  String title;
  List<String> content;
  bool isExpanded;

  ExpandBean(this.title, this.content, this.isExpanded);
}
