import 'package:flutter/material.dart';

import 'canvas_principle_page.dart';
import 'clip_rect_page.dart';
import 'draw_arc_page.dart';
import 'draw_circle_page.dart';
import 'draw_line_page.dart';
import 'draw_oval_page.dart';
import 'draw_path_page.dart';
import 'draw_points_page.dart';
import 'draw_rect_page.dart';
import 'line_chart_page.dart';
import 'paint_page.dart';
import 'rotate_page.dart';
import 'save_restore_page.dart';
import 'scale_page.dart';
import 'scratch_ticket_page.dart';
import 'skew_page.dart';
import 'text_painter_page.dart';
import 'translate_page.dart';
import 'water_waves_page.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget>{
      'Canvas原理': const CanvasPrinciplePage(),
      'Paint使用': const PaintPage(),
      'SaveRestore使用': const SaveRestorePage(),
      'Translate使用': const TranslatePage(),
      'Scale使用': const ScalePage(),
      'Rotate使用': const RotatePage(),
      'Skew使用': const SkewPage(),
      'DrawPoints使用': const DrawPointsPage(),
      'DrawLine使用': const DrawLinePage(),
      'DrawRect使用': const DrawRectPage(),
      'DrawCircle使用': const DrawCirclePage(),
      'DrawOval使用': const DrawOvalPage(),
      'DrawArc使用': const DrawArcPage(),
      'DrawPath使用': const DrawPathPage(),
      '水波荡漾效果': const WaterWavesPage(),
      '拆线图': const LineChartPage(),
      'ClipRect使用': const ClipRectPage(),
      '刮奖票': const ScratchTicketPage(),
      'TextPainter使用': const TextPainterPage(),
    };
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPaint')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: pages.keys.map((String title) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return pages[title]!;
                    },
                  ));
                },
                child: Text(title),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
