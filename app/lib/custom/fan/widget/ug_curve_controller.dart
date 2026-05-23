import 'dart:math' as math;

import 'package:flutter/foundation.dart';

/// 曲线控制点数据。
@immutable
class UgCurvePointData {
  const UgCurvePointData({
    required this.x,
    required this.y,
    this.locked = false,
    this.modified = false,
  });

  /// X 轴数据值。
  final double x;

  /// Y 轴数据值。
  final double y;

  /// 锁定点不可拖拽，通常用于 Tmax 禁用区。
  final bool locked;

  /// 用户直接拖动过的点，作为曲线锚点。
  final bool modified;

  UgCurvePointData copyWith({
    double? x,
    double? y,
    bool? locked,
    bool? modified,
  }) =>
      UgCurvePointData(
        x: x ?? this.x,
        y: y ?? this.y,
        locked: locked ?? this.locked,
        modified: modified ?? this.modified,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UgCurvePointData &&
              runtimeType == other.runtimeType &&
              x == other.x &&
              y == other.y &&
              locked == other.locked &&
              modified == other.modified;

  @override
  int get hashCode => Object.hash(x, y, locked, modified);
}

/// 曲线可调区间。
@immutable
class UgCurveRange {
  const UgCurveRange({
    required this.min,
    required this.max,
  });

  final double min;
  final double max;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UgCurveRange &&
              runtimeType == other.runtimeType &&
              min == other.min &&
              max == other.max;

  @override
  int get hashCode => Object.hash(min, max);
}

/// 曲线坐标轴配置。
@immutable
class UgCurveAxisConfig {
  const UgCurveAxisConfig({
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    this.xSteps = 4,
    this.ySteps = 5,
  })  : assert(maxX > minX),
        assert(maxY > minY),
        assert(xSteps > 0),
        assert(ySteps > 0);

  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final int xSteps;
  final int ySteps;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UgCurveAxisConfig &&
              runtimeType == other.runtimeType &&
              minX == other.minX &&
              maxX == other.maxX &&
              minY == other.minY &&
              maxY == other.maxY &&
              xSteps == other.xSteps &&
              ySteps == other.ySteps;

  @override
  int get hashCode => Object.hash(
    minX,
    maxX,
    minY,
    maxY,
    xSteps,
    ySteps,
  );
}

/// 曲线业务约束配置。
@immutable
class UgCurveConstraintConfig {
  const UgCurveConstraintConfig({
    required this.minY,
    required this.maxY,
    this.maxEditableX,
  }) : assert(maxY >= minY);

  final double minY;
  final double maxY;

  /// 允许编辑的最大 X 值，null 表示不限制。
  final double? maxEditableX;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UgCurveConstraintConfig &&
              runtimeType == other.runtimeType &&
              minY == other.minY &&
              maxY == other.maxY &&
              maxEditableX == other.maxEditableX;

  @override
  int get hashCode => Object.hash(minY, maxY, maxEditableX);
}

/// 风扇转速曲线控制器。
class UgCurveController extends ChangeNotifier {
  UgCurveController({
    required List<UgCurvePointData> points,
    required this.axisConfig,
    required this.constraintConfig,
    double? warningX,
  })  : _warningX = warningX,
        _points = _sortPoints(points);

  /// 坐标轴配置。
  final UgCurveAxisConfig axisConfig;

  /// 业务约束配置。
  UgCurveConstraintConfig constraintConfig;

  List<UgCurvePointData> _points;
  int? _draggingIndex;
  UgCurveRange? _activeRange;
  double? _warningX;

  /// 当前曲线点列表，按 X 升序排列。
  List<UgCurvePointData> get points =>
      List<UgCurvePointData>.unmodifiable(_points);

  /// 当前控制点数量。
  int get pointCount => _points.length;

  /// 当前拖拽点索引。
  int? get draggingIndex => _draggingIndex;

  /// 当前拖拽点可调 Y 区间。
  UgCurveRange? get activeRange => _activeRange;

  /// 警戒线 X 值，null 表示无警戒线。
  double? get warningX => _warningX;

  UgCurvePointData pointAt(int index) => _points[index];

  /// 更新警戒线和对应的编辑范围。
  void updateWarningX(double? warningX) {
    if (_warningX == warningX) {
      return;
    }
    _warningX = warningX;
    constraintConfig = UgCurveConstraintConfig(
      minY: constraintConfig.minY,
      maxY: constraintConfig.maxY,
      maxEditableX: warningX,
    );
    notifyListeners();
  }

  /// 以新曲线替换当前曲线并作为重置基线。
  void resetToPoints(List<UgCurvePointData> points) {
    setPoints(points);
  }

  /// 替换曲线点。
  void setPoints(List<UgCurvePointData> points) {
    _points = _sortPoints(points);
    _draggingIndex = null;
    _activeRange = null;
    notifyListeners();
  }

  /// 更新指定控制点的 Y 值。
  bool updatePointY(int index, double y) {
    if (!canDragPoint(index)) {
      return false;
    }
    final double clampedY = _clampY(index, y);
    if (_points[index].y == clampedY) {
      return false;
    }

    final List<UgCurvePointData> nextPoints = List<UgCurvePointData>.of(
      _points,
    )..[index] = _points[index].copyWith(
      y: clampedY,
      modified: true,
    );
    _points = _applyAnchorInterpolation(nextPoints, index);
    _activeRange = getAdjustableRange(index);
    notifyListeners();
    return true;
  }

  /// 开始拖拽指定控制点。
  bool startDrag(int index) {
    if (!canDragPoint(index)) {
      return false;
    }
    _draggingIndex = index;
    _activeRange = getAdjustableRange(index);
    notifyListeners();
    return true;
  }

  /// 使用数据坐标更新当前拖拽点 Y 值。
  bool updateDragByDataY(double y) {
    final int? index = _draggingIndex;
    if (index == null) {
      return false;
    }
    return updatePointY(index, y);
  }

  /// 结束拖拽。
  void endDrag() {
    if (_draggingIndex == null && _activeRange == null) {
      return;
    }
    _draggingIndex = null;
    _activeRange = null;
    notifyListeners();
  }

  /// 获取指定控制点的可调 Y 区间。
  UgCurveRange getAdjustableRange(int index) {
    if (!_validatePointIndex(index)) {
      return UgCurveRange(
        min: constraintConfig.minY,
        max: constraintConfig.maxY,
      );
    }

    double minAllowed = constraintConfig.minY;
    double maxAllowed = constraintConfig.maxY;
    final int? leftAnchorIndex = _nearestAnchorIndex(
      _points,
      index,
      searchLeft: true,
    );
    final int? rightAnchorIndex = _nearestAnchorIndex(
      _points,
      index,
      searchLeft: false,
    );

    if (index > 0) {
      final UgCurvePointData leftBoundary = _points[leftAnchorIndex ?? 0];
      minAllowed = math.max(minAllowed, leftBoundary.y);
    }
    if (index < _points.length - 1) {
      final UgCurvePointData rightBoundary =
          _points[rightAnchorIndex ?? _points.length - 1];
      maxAllowed = math.min(maxAllowed, rightBoundary.y);
    }
    return UgCurveRange(min: minAllowed, max: maxAllowed);
  }

  /// 是否允许拖拽指定控制点。
  bool canDragPoint(int index) {
    if (!_validatePointIndex(index)) {
      return false;
    }
    final UgCurvePointData point = _points[index];
    if (point.locked) {
      return false;
    }
    final double? maxEditableX = constraintConfig.maxEditableX;
    return maxEditableX == null || point.x <= maxEditableX;
  }

  static List<UgCurvePointData> _sortPoints(List<UgCurvePointData> points) {
    return List<UgCurvePointData>.of(points)
      ..sort(
            (UgCurvePointData a, UgCurvePointData b) => a.x.compareTo(b.x),
      );
  }

  double _clampY(int index, double y) {
    final UgCurveRange range = getAdjustableRange(index);
    return y.clamp(range.min, range.max);
  }

  bool _validatePointIndex(int index) => index >= 0 && index < _points.length;

  int? _nearestAnchorIndex(
    List<UgCurvePointData> points,
    int index, {
    required bool searchLeft,
  }) {
    if (index < 0 || index >= points.length) {
      return null;
    }
    if (searchLeft) {
      for (int i = index - 1; i >= 0; i--) {
        if (_isAnchor(points[i])) {
          return i;
        }
      }
      return null;
    }
    for (int i = index + 1; i < points.length; i++) {
      if (_isAnchor(points[i])) {
        return i;
      }
    }
    return null;
  }

  bool _isAnchor(UgCurvePointData point) => point.modified || point.locked;

  List<UgCurvePointData> _applyAnchorInterpolation(
    List<UgCurvePointData> points,
    int changedIndex,
  ) {
    if (changedIndex < 0 || changedIndex >= points.length) {
      return points;
    }

    final List<UgCurvePointData> next = List<UgCurvePointData>.of(points);

    if (changedIndex > 0) {
      final int leftBoundaryIndex = _nearestAnchorIndex(
            next,
            changedIndex,
            searchLeft: true,
          ) ??
          0;
      _interpolateBetween(next, leftBoundaryIndex, changedIndex);
    }

    if (changedIndex < next.length - 1) {
      final int rightBoundaryIndex = _nearestAnchorIndex(
            next,
            changedIndex,
            searchLeft: false,
          ) ??
          next.length - 1;
      _interpolateBetween(next, changedIndex, rightBoundaryIndex);
    }

    return next;
  }

  void _interpolateBetween(
    List<UgCurvePointData> points,
    int startIndex,
    int endIndex,
  ) {
    if (endIndex - startIndex <= 1) {
      return;
    }

    final UgCurvePointData start = points[startIndex];
    final UgCurvePointData end = points[endIndex];
    final double width = end.x - start.x;
    if (width.abs() < 1e-9) {
      return;
    }

    for (int i = startIndex + 1; i < endIndex; i++) {
      final UgCurvePointData point = points[i];
      if (_isAnchor(point)) {
        continue;
      }
      final double ratio = (point.x - start.x) / width;
      points[i] = point.copyWith(
        y: start.y + ratio * (end.y - start.y),
      );
    }
  }
}
