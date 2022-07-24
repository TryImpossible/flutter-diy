import 'package:app/framework/custom_paint/canvas_principle_page.dart';
import 'package:app/framework/custom_paint/clip_rect_page.dart';
import 'package:app/framework/custom_paint/line_chart_page.dart';
import 'package:app/framework/custom_paint/save_restore_page.dart';
import 'package:app/framework/custom_paint/text_painter_page.dart';
import 'package:app/framework/custom_paint/water_waves_page.dart';
import 'package:flutter/material.dart';

import 'draw_path_page.dart';
import 'paint_page.dart';
import 'scratch_ticket_page.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CustomPaint')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const CanvasPrinciplePage();
                    },
                  ));
                },
                child: const Text('Canvas原理'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const PaintPage();
                    },
                  ));
                },
                child: const Text('Paint使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SaveRestorePage();
                    },
                  ));
                },
                child: const Text('SaveRestore使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ScratchTicketPage();
                    },
                  ));
                },
                child: const Text('刮奖票'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ClipRectPage();
                    },
                  ));
                },
                child: const Text('ClipRect使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const DrawPathPage();
                    },
                  ));
                },
                child: const Text('DrawPath使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const WaterWavesPage();
                    },
                  ));
                },
                child: const Text('水波荡漾效果'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const LineChartPage();
                    },
                  ));
                },
                child: const Text('拆线图'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TextPainterPage();
                    },
                  ));
                },
                child: const Text('TextPainter使用'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
