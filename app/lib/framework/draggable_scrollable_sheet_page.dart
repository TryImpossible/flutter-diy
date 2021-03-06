import 'package:flutter/material.dart';

class DraggableScrollableSheetPage extends StatelessWidget {
  const DraggableScrollableSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet控件'),
      ),
      body: DraggableScrollableSheet(
        maxChildSize: 0.75,
        initialChildSize: 0.75,
        builder: (BuildContext context, ScrollController scrollController) {
          return _buildScrollableWidget(scrollController);
        },
      ),
    );
  }

  Widget _buildScrollableWidget(ScrollController scrollController) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            Container(
              height: 5.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              margin: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Column(
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            'assets/images/lufei.jpeg',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text('海贼王'),
                      ],
                    ),
                  );
                },
                itemCount: 12,
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Current Item = ${(index + 1)}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
