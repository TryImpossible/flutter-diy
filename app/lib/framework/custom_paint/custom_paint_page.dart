import 'package:app/framework/custom_paint/canvas_principle_page.dart';
import 'package:app/framework/custom_paint/clip_rect_page.dart';
import 'package:app/framework/custom_paint/line_chart_page.dart';
import 'package:app/framework/custom_paint/text_painter_page.dart';
import 'package:app/framework/custom_paint/water_waves_page.dart';
import 'package:flutter/material.dart';

import 'draw_path_page.dart';
import 'paint_page.dart';
import 'scratch_ticket_page.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomPaint')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CanvasPrinciplePage();
                    },
                  ));
                },
                child: Text('Canvas原理'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PaintPage();
                    },
                  ));
                },
                child: Text('Paint使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ScratchTicketPage();
                    },
                  ));
                },
                child: Text('刮奖票'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ClipRectPage();
                    },
                  ));
                },
                child: Text('ClipRect使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return DrawPathPage();
                    },
                  ));
                },
                child: Text('DrawPath使用'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return WaterWavesPage();
                    },
                  ));
                },
                child: Text('水波荡漾效果'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LineChartPage();
                    },
                  ));
                },
                child: Text('拆线图'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TextPainterPage();
                    },
                  ));
                },
                child: Text('TextPainter使用'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
