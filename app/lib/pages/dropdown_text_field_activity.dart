import 'package:app/widget/dropdown_text_field.dart';
import 'package:flutter/material.dart';

class DropdownTextFieldActivity extends StatelessWidget {
  const DropdownTextFieldActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉输入文本'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.green,
            ),
            TextField(),
            // Container(
            //   height: 500,
            //   color: Colors.green,
            // ),
            DropdownTextField(
              // initialValue: '语文',
              controller: DropdownTextFieldController(initialValue: '英语'),
              items: [
                DropdownMenuItem(child: Text('语文'), value: '语文'),
                DropdownMenuItem(
                  child: Text('数学'),
                  value: '数学',
                  onTap: () => print('outer value'),
                ),
                DropdownMenuItem(child: Text('英语'), value: '英语'),
              ],
            ),
            DropdownButton(
              value: '语文',
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(child: Text('语文'), value: '语文'),
                DropdownMenuItem(child: Text('数学'), value: '数学'),
                DropdownMenuItem(child: Text('英语'), value: '英语'),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
