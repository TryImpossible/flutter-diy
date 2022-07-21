import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TextPainterPage extends StatelessWidget {
  const TextPainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('TextPainter')),
      body: Center(
        child: ColoredBox(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: _MyPainter(),
            size: Size.square(size.width),
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.translate(0, 10);

    /// 画文字
    final TextPainter textPainter =
        TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = const TextSpan(
      text: 'АБВおかがご★轩☆ゞΕΖΗ叁肆伍陆ㄉㄊㄋ'
          'АБВおかがご★轩☆ゞΕΖΗ叁肆伍陆ㄉㄊㄋ'
          'АБВおかがご★轩☆ゞΕΖΗ叁肆伍陆ㄉㄊㄋ',
      style: TextStyle(fontSize: 20, color: Colors.red),
    );
    textPainter.layout(maxWidth: size.width);
    textPainter.paint(canvas, Offset.zero);

    /// 获取LineMetrics
    ui.LineMetrics lineMetrics = textPainter.computeLineMetrics()[0];
    debugPrint('LineMetrics: $lineMetrics');

    /// 基准线 alphabetic
    final double a =
        textPainter.computeDistanceToActualBaseline(TextBaseline.alphabetic);
    canvas.drawLine(
      Offset(0, a),
      Offset(lineMetrics.width, a),
      Paint()
        ..color = Colors.red
        ..strokeWidth = 1,
    );

    /// 基准线 ideographic
    final double b =
        textPainter.computeDistanceToActualBaseline(TextBaseline.ideographic);
    canvas.drawLine(
      Offset(0, b),
      Offset(lineMetrics.width, b),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    final List<TextBox> textBoxes = textPainter.getBoxesForSelection(
      const TextSelection(
        baseOffset: 0,
        extentOffset: 18,
        affinity: TextAffinity.downstream,
        isDirectional: true,
      ),
    );
    for (var box in textBoxes) {
      canvas.drawRect(
        Rect.fromLTRB(box.left, box.top, box.right, box.bottom),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );
    }

    /// 获取行的边界
    TextRange textRange =
        textPainter.getLineBoundary(const TextPosition(offset: 8));
    debugPrint('getLineBoundary: ${textRange.toString()}');

    /// 获取单词的边界
    textRange = textPainter.getWordBoundary(const TextPosition(offset: 1));
    debugPrint('getWordBoundary: ${textRange.toString()}');

    final ui.ParagraphBuilder builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.left,
      fontSize: 20,
      textDirection: TextDirection.ltr,
    ));
    builder.pushStyle(ui.TextStyle(fontSize: 16, color: Colors.red));
    builder.addText('АБВおかがご★轩☆ゞΕΖΗ叁肆伍陆ㄉㄊㄋ');
    builder.pushStyle(ui.TextStyle(fontSize: 20, color: Colors.black));
    builder.addText('АБВおかがご★轩☆ゞΕΖΗ叁肆伍陆ㄉㄊㄋ');
    final ui.Paragraph paragraph = builder.build()
      ..layout(const ui.ParagraphConstraints(width: 300));
    canvas.drawParagraph(paragraph, const Offset(0, 180));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
