import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool _tapped = false;

Decoration get boxDecoration => BoxDecoration(
      color: _tapped ? const Color(0x22000000) : const Color(0xFF000000),
    );

void runRenderObjectUI() {
  // RenderDecoratedBox box = RenderDecoratedBox(decoration: boxDecoration);
  // RenderingFlutterBinding(
  //   root: RenderDecoratedBox(
  //     decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
  //     child: RenderPositionedBox(
  //       alignment: Alignment.center,
  //       child: RenderPointerListener(
  //         onPointerUp: (PointerUpEvent event) {
  //           _tapped = !_tapped;
  //           box.decoration = boxDecoration;
  //           box.reassemble();
  //         },
  //         child: RenderConstrainedBox(
  //           additionalConstraints: BoxConstraints.tight(const Size(100, 100)),
  //           child: box,
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  // window.scheduleFrame();
}

// bool tapped = false;
//
// BoxDecoration createDecoration() {
//   return BoxDecoration(color: colorWith(tapped));
// }
//
// colorWith(bool tapped) {
//   return Color(0xff000000);
// }
//
// void runRenderObjectUI() {
//   var box = RenderDecoratedBox(decoration: createDecoration());
//   RenderingFlutterBinding(
//     root: RenderDecoratedBox(
//       decoration: BoxDecoration(color: Color(0xffffffff)),
//       child: RenderPositionedBox(
//         alignment: Alignment.center,
//         child: RenderPointerListener(
//           onPointerUp: (PointerUpEvent event) {
//             tapped = !tapped;
//             box.decoration = createDecoration();
//             box.reassemble();
//           },
//           child: RenderConstrainedBox(
//             // child: box,
//             additionalConstraints: BoxConstraints.tight(Size(100, 100)),
//           ),
//         ),
//       ),
//     ),
//   );
// }
