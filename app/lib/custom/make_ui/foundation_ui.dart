import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';

bool _tapped = false;

void runFoundationUI() {
  window.onBeginFrame = _render;
  window.onMetricsChanged = window.scheduleFrame;
  window.onPointerDataPacket = _handlePointerPacket;
  window.scheduleFrame();
}

void _render(Duration duration) {
  // 1.创建绘制记录器和Canvas
  final PictureRecorder recorder = PictureRecorder();
  final Canvas canvas = Canvas(recorder);
  Paint background = Paint()..color = const Color(0xFFFFFFFF);
  canvas.drawPaint(background);

  // 在指定位置区域绘制。
  Paint paint = Paint()
    ..style = PaintingStyle.fill
    ..color = _tapped ? const Color(0x22000000) : const Color(0xFF000000);
  canvas.drawRect(_centerRect, paint);

  // 获取绘制产物
  Picture picture = recorder.endRecording();

  // 将绘制的内容显示在屏幕上。
  SceneBuilder builder = SceneBuilder();
  builder.pushTransform(Float64List.fromList(Matrix4.identity().storage));
  builder.addPicture(Offset.zero, picture);
  Scene scene = builder.build();
  window.render(scene);
}

/// 获取中的100x100位置
Rect get _centerRect {
  Size size = window.physicalSize;
  Size centerSize = const Size(100, 100) * window.devicePixelRatio;
  return Rect.fromLTWH(
    (size.width - centerSize.width) / 2,
    (size.height - centerSize.height) / 2,
    centerSize.width,
    centerSize.height,
  );
}

/// 判断offset是否处于100x100位置内
bool _inCenterRect(Offset offset) {
  Rect rect = _centerRect;
  return rect.contains(offset);
}

/// 处理点击
void _handlePointerPacket(PointerDataPacket dataPacket) {
  PointerData data = dataPacket.data.first;
  if (_inCenterRect(Offset(data.physicalX, data.physicalY))) {
    _tapped = !_tapped;
    window.scheduleFrame();
  }
}
