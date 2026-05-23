import 'package:app/custom/fan/widget/ug_curve_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UgCurveController', () {
    test('raises middle point by interpolating to implicit edge anchors', () {
      final UgCurveController controller = _createController(
        <double>[20, 30, 40, 70, 100],
      );

      final bool changed = controller.updatePointY(2, 80);

      expect(changed, isTrue);
      expect(_ys(controller), <double>[20, 50, 80, 90, 100]);
      expect(controller.pointAt(2).modified, isTrue);
      expect(controller.pointAt(1).modified, isFalse);
      expect(controller.pointAt(3).modified, isFalse);
    });

    test('lowers middle point by interpolating to implicit edge anchors', () {
      final UgCurveController controller = _createController(
        <double>[20, 40, 60, 80, 100],
      );

      final bool changed = controller.updatePointY(2, 30);

      expect(changed, isTrue);
      expect(_ys(controller), <double>[20, 25, 30, 65, 100]);
    });

    test('only recalculates unmodified points between nearest anchors', () {
      final UgCurveController controller = _createController(
        <double>[20, 30, 40, 50, 60, 70, 80],
        modifiedIndexes: <int>{1, 5},
      );

      final bool changed = controller.updatePointY(3, 60);

      expect(changed, isTrue);
      expect(_ys(controller), <double>[20, 30, 45, 60, 65, 70, 80]);
      expect(controller.pointAt(1).modified, isTrue);
      expect(controller.pointAt(3).modified, isTrue);
      expect(controller.pointAt(5).modified, isTrue);
      expect(controller.pointAt(0).y, 20);
      expect(controller.pointAt(6).y, 80);
    });

    test('uses locked points as interpolation boundaries and preserves them', () {
      final UgCurveController controller = _createController(
        <double>[20, 35, 50, 65, 100],
        lockedIndexes: <int>{4},
      );

      final bool changed = controller.updatePointY(2, 80);

      expect(changed, isTrue);
      expect(_ys(controller), <double>[20, 50, 80, 90, 100]);
      expect(controller.pointAt(4).locked, isTrue);
      expect(controller.pointAt(4).modified, isFalse);
    });

    test('falls back to edge anchors when computing adjustable range', () {
      final UgCurveController controller = _createController(
        <double>[20, 40, 60, 80, 100],
      );

      expect(
        controller.getAdjustableRange(2),
        const UgCurveRange(
          min: 20,
          max: 100,
        ),
      );
      expect(
        controller.getAdjustableRange(0),
        const UgCurveRange(
          min: 20,
          max: 100,
        ),
      );
      expect(
        controller.getAdjustableRange(4),
        const UgCurveRange(
          min: 20,
          max: 100,
        ),
      );
    });

    test('uses nearest modified anchors when computing adjustable range', () {
      final UgCurveController controller = _createController(
        <double>[20, 35, 50, 65, 80],
        modifiedIndexes: <int>{1, 3},
      );

      expect(
        controller.getAdjustableRange(2),
        const UgCurveRange(
          min: 35,
          max: 65,
        ),
      );
    });
  });
}

UgCurveController _createController(
  List<double> ys, {
  Set<int> modifiedIndexes = const <int>{},
  Set<int> lockedIndexes = const <int>{},
}) {
  return UgCurveController(
    points: <UgCurvePointData>[
      for (int i = 0; i < ys.length; i++)
        UgCurvePointData(
          x: (i * 10).toDouble(),
          y: ys[i],
          modified: modifiedIndexes.contains(i),
          locked: lockedIndexes.contains(i),
        ),
    ],
    axisConfig: const UgCurveAxisConfig(
      minX: 0,
      maxX: 40,
      minY: 0,
      maxY: 100,
    ),
    constraintConfig: const UgCurveConstraintConfig(
      minY: 20,
      maxY: 100,
    ),
  );
}

List<double> _ys(UgCurveController controller) =>
    controller.points.map((UgCurvePointData point) => point.y).toList();
