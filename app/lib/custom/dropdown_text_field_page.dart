import 'package:app/custom/app_dropdown_text_field.dart';
import 'package:flutter/material.dart';

class DropdownTextFieldPage extends StatelessWidget {
  const DropdownTextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉输入文本'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: ListView(
          children: [
            Container(
              height: 100,
              color: Colors.green,
            ),
            const TextField(),
            // Container(
            //   height: 500,
            //   color: Colors.green,
            // ),
            AppDropdownTextField(
              // initialValue: '语文',
              controller: AppDropdownTextFieldController(initialValue: '英语'),
              items: [
                const DropdownMenuItem(value: '语文', child: Text('语文')),
                DropdownMenuItem(
                  value: '数学',
                  onTap: () => debugPrint('outer value'),
                  child: const Text('数学'),
                ),
                const DropdownMenuItem(value: '英语', child: Text('英语')),
              ],
            ),
            DropdownButton(
              value: '语文',
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(value: '语文', child: Text('语文')),
                DropdownMenuItem(value: '数学', child: Text('数学')),
                DropdownMenuItem(value: '英语', child: Text('英语')),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
