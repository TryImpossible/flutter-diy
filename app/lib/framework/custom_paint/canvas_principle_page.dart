import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanvasPrinciplePage extends StatelessWidget {
  const CanvasPrinciplePage({Key? key}) : super(key: key);

  Future<ByteData?> _canvasToImage() async {
    ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    Rect rect = Rect.fromPoints(Offset.zero, ui.Offset(300, 300));
    Canvas canvas = Canvas(pictureRecorder, rect);
    canvas.drawColor(Colors.red, BlendMode.color);
    ui.Picture picture = pictureRecorder.endRecording();
    return picture.toImage(300, 300).then(
        (ui.Image value) => value.toByteData(format: ui.ImageByteFormat.png));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Canvas原理')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('直接new Canvas转成图片加载'),
            SizedBox(height: 12),
            FutureBuilder<ByteData?>(
              future: _canvasToImage(),
              builder: (_, AsyncSnapshot<ByteData?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.memory(Uint8List.view(snapshot.data!.buffer));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
