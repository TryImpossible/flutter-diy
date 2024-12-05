import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DigitalKeypadPage extends StatelessWidget {
  const DigitalKeypadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Keypad')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            _DigitalInput(
              controller: controller,
              scrollController: scrollController,
            ),
            const SizedBox(height: 16),
            _KeypadPanel(
              onTap: (String text) => _onKeypadTap(
                text,
                controller: controller,
                scrollController: scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 处理键盘点击
  void _onKeypadTap(
    String text, {
    required TextEditingController controller,
    required ScrollController scrollController,
  }) {
    if (text.isClear) {
      controller.clear();
    } else if (text.isDelete) {
      controller.value = TextEditingValue(
        text: controller.text.substring(0, max(controller.text.length - 1, 0)),
      );
    } else {
      controller.value = TextEditingValue(
        text: controller.text + text,
      );
      SchedulerBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 80),
          curve: Curves.linear,
        );
      });
    }
  }
}

/// 数字输入框
class _DigitalInput extends StatelessWidget {
  const _DigitalInput({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  final TextEditingController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    );
    return IgnorePointer(
      child: TextField(
        readOnly: true,
        showCursor: true,
        autofocus: true,
        controller: controller,
        scrollController: scrollController,
        decoration: const InputDecoration(
          border: border,
          focusedBorder: border,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

/// 数字键位
List<String> _digitalList = List.generate(10, (int index) => index.toString());

/// 删除键位
const String _deleteKey = '←';

/// 清除键位
const String _clearKey = 'C';

/// 判断点击的键位
extension on String {
  bool get isDelete => this == _deleteKey;

  bool get isClear => this == _clearKey;
}

/// 键盘面板
class _KeypadPanel extends StatelessWidget {
  const _KeypadPanel({
    super.key,
    required this.onTap,
  });

  final ValueSetter<String> onTap;

  @override
  Widget build(BuildContext context) {
    /// 数字键位，重新排序
    _digitalList.shuffle();
    final List<String> keyList = List.from(_digitalList)
      ..addAll(<String>[_deleteKey, _clearKey]);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: keyList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 0.7,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (_, int index) {
          final Color backgroundColor =
              keyList.length - index > 2 ? Colors.blue : Colors.red;
          final String text = keyList[index];
          return _KeypadItem(
            backgroundColor: backgroundColor,
            text: text,
            onTap: () => onTap(text),
          );
        },
      ),
    );
  }
}

/// 键位
class _KeypadItem extends StatelessWidget {
  const _KeypadItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
  });

  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey.withOpacity(0.8),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
