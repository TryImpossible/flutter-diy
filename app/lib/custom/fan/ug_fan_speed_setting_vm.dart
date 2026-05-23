import 'package:app/custom/fan/ug_fan_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'ug_sensor_temp_polling_manager.dart';
import 'widget/ug_curve_controller.dart';

/// 风扇转速曲线设置 ViewModel。
class UgFanSpeedSettingVM {
  UgFanSpeedSettingVM(this.fanType, this.fanConfig);

  static const int curvePointCount = 17;
  static const int curveTemperatureStep = 5;

  /// 风扇类型。
  final FanType fanType;

  /// 风扇配置。
  UgFanConfig fanConfig;

  /// 传感器温度列表。
  final RxList<UgSensorTempData> sensorTemps = <UgSensorTempData>[].obs;

  /// 当前温度展示单位。
  final RxInt tempUnit = UgSensorTempPollingManager.celsiusUnit.obs;

  /// 温度警告文案。
  final RxString tempWarningText = ''.obs;

  /// 曲线控制器。
  late final UgCurveController curveController;

  UgSensorTempPollingManager? _sensorTempPollingManager;

  /// X 轴最大温度。
  double get maxTemperature => 80.0;

  /// Y 轴最大转速百分比。
  double get maxSpeedPercent => 100.0;

  /// Y 轴最小转速百分比。
  double get minSpeedPercent => 20.0;

  /// 是否为 CPU 风扇。
  bool get isCpuFan => fanType == FanType.cpu;

  /// 当前温度单位是否为华氏度。
  bool get isTempUnitF =>
      tempUnit.value == UgSensorTempPollingManager.fahrenheitUnit;

  /// 当前曲线是否与重置基准不同。
  bool get canResetCurve {
    final List<UgCurvePointData> currentPoints = _normalizeCurvePoints(
      curveController.points,
    );
    final List<UgCurvePointData> resetPoints = _resetBaselinePoints();
    if (currentPoints.length != resetPoints.length) {
      return true;
    }
    for (int i = 0; i < currentPoints.length; i++) {
      final UgCurvePointData current = currentPoints[i];
      final UgCurvePointData baseline = resetPoints[i];
      if (current.x != baseline.x ||
          current.y != baseline.y ||
          current.locked != baseline.locked) {
        return true;
      }
    }
    return false;
  }

  /// 温度警告线位置。
  double? get tempWarningLine => curveController.warningX;

  /// 初始化数据。
  void initData() {
    final double? warningLine = _resolveTempWarningLine();
    curveController = UgCurveController(
      points: _applyTempWarningToPoints(
        _initialOrDefaultCurvePoints(),
        warningLine,
      ),
      axisConfig: UgCurveAxisConfig(
        minX: 0,
        maxX: maxTemperature,
        minY: 0,
        maxY: maxSpeedPercent,
      ),
      constraintConfig: UgCurveConstraintConfig(
        minY: minSpeedPercent,
        maxY: maxSpeedPercent,
        maxEditableX: warningLine,
      ),
      warningX: warningLine,
    );
    _sensorTempPollingManager?.dispose();
    _sensorTempPollingManager = UgSensorTempPollingManager(
      onTempsChanged: _handleSensorTempsChanged,
    )..start();
  }

  /// 重置曲线。
  void resetCurve() {
    curveController.resetToPoints(_resetBaselinePoints());
  }

  /// 更新当前保存基线配置。
  void updateFanConfig(UgFanConfig config) {
    fanConfig = config;
  }

  /// 生成当前曲线对应的自定义风扇配置。
  UgFanConfig buildCustomFanConfig() {
    final List<List<int>> fanTable = _normalizeCurvePoints(
      curveController.points,
    )
        .map(
          (UgCurvePointData point) => <int>[
        point.x.round(),
        point.y.round(),
      ],
    )
        .toList();
    return fanConfig.copyWith(
      mode: FanMode.custom.value,
      sysFanTable: isCpuFan ? fanConfig.sysFanTable ?? <List<int>>[] : fanTable,
      cpuFanTable: isCpuFan ? fanTable : fanConfig.cpuFanTable ?? <List<int>>[],
    );
  }

  /// 释放资源。
  void dispose() {
    _sensorTempPollingManager?.dispose();
    _sensorTempPollingManager = null;
    curveController.dispose();
  }

  void _handleSensorTempsChanged(List<UgSensorTempData> temps) {
    if (temps.isEmpty) {
      return;
    }
    final List<UgSensorTempData> sensorTempList =
    List<UgSensorTempData>.of(temps);
    sensorTemps.value = sensorTempList;
    tempUnit.value = sensorTempList.first.tempUnit;
    final double? warningLine = _resolveTempWarningLine();
    _applyTempWarningLine(warningLine);
  }

  void _applyTempWarningLine(double? warningLine) {
    final List<UgCurvePointData> currentPoints = _normalizeCurvePoints(
      curveController.points,
    );
    final List<UgCurvePointData> nextPoints = _applyTempWarningToPoints(
      currentPoints,
      warningLine,
    );

    curveController.updateWarningX(warningLine);
    if (!listEquals(currentPoints, nextPoints)) {
      curveController.setPoints(nextPoints);
    }
  }

  List<UgCurvePointData> _initialOrDefaultCurvePoints() {
    final List<UgCurvePointData> tablePoints = _initialCurvePoints();
    return tablePoints.isNotEmpty ? tablePoints : _defaultCurvePoints();
  }

  List<UgCurvePointData> _defaultCurvePoints() {
    return List<UgCurvePointData>.generate(
      curvePointCount,
      (int index) => UgCurvePointData(
        x: (index * curveTemperatureStep).toDouble(),
        y: minSpeedPercent +
            (index / (curvePointCount - 1)) *
                (maxSpeedPercent - minSpeedPercent),
      ),
    );
  }

  List<UgCurvePointData> _defaultCurvePointsForWarning(double? warningLine) {
    if (isCpuFan || warningLine == null) {
      return _defaultCurvePoints();
    }
    final double denominator = warningLine <= 0 ? 1 : warningLine;
    return List<UgCurvePointData>.generate(
      curvePointCount,
      (int index) {
        final double x = (index * curveTemperatureStep).toDouble();
        final double y = x >= warningLine
            ? maxSpeedPercent
            : minSpeedPercent +
                (x / denominator) * (maxSpeedPercent - minSpeedPercent);
        return UgCurvePointData(x: x, y: y);
      },
    );
  }

  List<UgCurvePointData> _resetBaselinePoints() {
    return _applyTempWarningToPoints(
      _defaultCurvePointsForWarning(curveController.warningX),
      curveController.warningX,
    );
  }

  List<UgCurvePointData> _applyTempWarningToPoints(
    List<UgCurvePointData> sourcePoints,
    double? warningLine,
  ) {
    final List<UgCurvePointData> points = _normalizeCurvePoints(sourcePoints);

    if (isCpuFan || warningLine == null) {
      return points
          .map(
            (UgCurvePointData point) => point.copyWith(locked: false),
          )
          .toList();
    }

    if (_matchesRoundedWarningBaseline(points, warningLine)) {
      return _defaultCurvePointsForWarning(warningLine)
          .map(
            (UgCurvePointData point) => point.copyWith(
              locked: point.x >= warningLine,
              modified: false,
            ),
          )
          .toList();
    }

    final List<UgCurvePointData> warningPoints = points.map(
      (UgCurvePointData point) {
        final bool isWarningPoint = point.x == warningLine;
        final bool isWarningOrOverLimit =
            isWarningPoint || point.x > warningLine;
        return point.copyWith(
          y: isWarningOrOverLimit ? maxSpeedPercent : point.y,
          locked: isWarningOrOverLimit,
          modified: !isWarningOrOverLimit && point.modified,
        );
      },
    ).toList();

    return warningPoints
      ..sort(
            (UgCurvePointData a, UgCurvePointData b) => a.x.compareTo(b.x),
      );
  }

  List<UgCurvePointData> _initialCurvePoints() {
    final List<List<int>> table =
        (isCpuFan ? fanConfig.cpuFanTable : fanConfig.sysFanTable) ??
        <List<int>>[];
    if (table.isEmpty) {
      return <UgCurvePointData>[];
    }
    return _normalizeCurvePoints(
      table
          .map(
            (List<int> point) => UgCurvePointData(
              x: point[0].toDouble(),
              y: point[1].toDouble(),
            ),
          )
          .toList(),
    );
  }

  double? _resolveTempWarningLine() {
    if (isCpuFan) {
      tempWarningText.value = '';
      return null;
    }

    int? warningLimit;
    String? warningName;
    for (final UgSensorTempData sensor in sensorTemps) {
      if (sensor.name == 'CPU') {
        continue;
      }
      if (sensor.isOverTemp) {
        if (warningLimit == null || sensor.tempLimit! < warningLimit) {
          warningLimit = sensor.tempLimit;
          warningName = sensor.name;
        }
      }
    }

    if (warningLimit != null && warningName != null) {
      tempWarningText.value = warningName;
      return warningLimit.toDouble();
    }
    tempWarningText.value = '';
    return null;
  }

  List<UgCurvePointData> _normalizeCurvePoints(
    List<UgCurvePointData> sourcePoints,
  ) {
    if (sourcePoints.isEmpty) {
      return _defaultCurvePoints();
    }

    final Map<double, UgCurvePointData> sanitizedByX =
        <double, UgCurvePointData>{};
    for (final UgCurvePointData point in sourcePoints) {
      final double x = point.x.clamp(0.0, maxTemperature);
      sanitizedByX[x] = point.copyWith(
        x: x,
        y: point.y.clamp(minSpeedPercent, maxSpeedPercent),
      );
    }
    final List<UgCurvePointData> sorted = sanitizedByX.values.toList()
      ..sort(
        (UgCurvePointData a, UgCurvePointData b) => a.x.compareTo(b.x),
      );

    final List<UgCurvePointData> normalized = List<UgCurvePointData>.generate(
      curvePointCount,
      (int index) {
        final double x = (index * curveTemperatureStep).toDouble();
        final UgCurvePointData? exactPoint = sanitizedByX[x];
        return UgCurvePointData(
          x: x,
          y: _interpolateY(sorted, x),
          locked: exactPoint?.locked ?? false,
          modified: exactPoint?.modified ?? false,
        );
      },
    );

    return _ensureMonotonic(normalized);
  }

  List<UgCurvePointData> _ensureMonotonic(List<UgCurvePointData> points) {
    double previousY = minSpeedPercent;
    return points.map((UgCurvePointData point) {
      final double y = point.y
          .clamp(minSpeedPercent, maxSpeedPercent)
          .clamp(previousY, maxSpeedPercent);
      previousY = y;
      return point.copyWith(y: y);
    }).toList();
  }

  double _interpolateY(List<UgCurvePointData> sorted, double x) {
    if (sorted.isEmpty) {
      return _defaultCurvePoints()[x ~/ curveTemperatureStep].y;
    }
    if (x <= sorted.first.x) {
      return sorted.first.y;
    }
    if (x >= sorted.last.x) {
      return sorted.last.y;
    }
    for (int i = 0; i < sorted.length - 1; i++) {
      final UgCurvePointData left = sorted[i];
      final UgCurvePointData right = sorted[i + 1];
      if (x >= left.x && x <= right.x) {
        final double width = right.x - left.x;
        if (width.abs() < 1e-9) {
          return left.y;
        }
        final double ratio = (x - left.x) / width;
        return left.y + ratio * (right.y - left.y);
      }
    }
    return minSpeedPercent;
  }

  bool _matchesRoundedWarningBaseline(
    List<UgCurvePointData> points,
    double warningLine,
  ) {
    if (points.any((UgCurvePointData point) => point.modified)) {
      return false;
    }
    final List<UgCurvePointData> baseline = _defaultCurvePointsForWarning(
      warningLine,
    );
    final List<UgCurvePointData> normalizedPoints = _normalizeCurvePoints(
      points,
    );
    if (normalizedPoints.length != baseline.length) {
      return false;
    }
    for (int i = 0; i < normalizedPoints.length; i++) {
      final UgCurvePointData point = normalizedPoints[i];
      final UgCurvePointData baselinePoint = baseline[i];
      if (point.x != baselinePoint.x ||
          point.y.round() != baselinePoint.y.round()) {
        return false;
      }
    }
    return true;
  }
}
