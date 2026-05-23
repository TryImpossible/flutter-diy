import 'dart:async';

import 'package:flutter/foundation.dart';

/// 传感器温度数据。
@immutable
class UgSensorTempData {
  const UgSensorTempData({
    required this.name,
    required this.temp,
    this.tempUnit = UgSensorTempPollingManager.celsiusUnit,
    this.tempLimit,
  });

  /// 传感器名称。
  final String name;

  /// 当前温度。
  final int temp;

  /// 当前展示温度单位。1: 摄氏度，2: 华氏度。
  final int tempUnit;

  /// 温度上限（HDD:55°C, SSD:70°C, CPU:80°C）。
  final int? tempLimit;

  /// 是否 CPU 温度。
  bool get isCpuTemp => name == 'CPU';

  /// 是否超温。
  bool get isOverTemp => tempLimit != null && temp >= tempLimit!;

  /// 根据用户温度单位配置格式化展示温度。
  String get displayTempText {
    final bool isTempUnitF =
        tempUnit == UgSensorTempPollingManager.fahrenheitUnit;
    return UgSensorTempPollingManager.formatTempText(
      temp,
      isTempUnitF: isTempUnitF,
      usePlaceholderForZero: true,
    );
  }
}

/// 风扇传感器温度轮询管理器。
class UgSensorTempPollingManager {
  UgSensorTempPollingManager({
    required this.onTempsChanged,
    this.interval = defaultPollingInterval,
  });

  static const Duration defaultPollingInterval = Duration(seconds: 5);
  static const int celsiusUnit = 1;
  static const int fahrenheitUnit = 2;
  static const int cpuTempLimit = 80;
  static const int hddTempLimit = 55;
  static const int ssdTempLimit = 70;
  static const String celsiusUnitText = '℃';
  static const String fahrenheitUnitText = '°F';

  final ValueChanged<List<UgSensorTempData>> onTempsChanged;
  final Duration interval;

  Timer? _timer;
  bool _isRequesting = false;
  bool _disposed = false;

  /// 开始轮询，并立即请求一次。
  void start() {
    refresh();
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => refresh());
  }

  /// 手动刷新一次温度。
  Future<void> refresh() async {
    if (_disposed || _isRequesting) {
      return;
    }

    // int tempUnit = 1;
    // final List<UgSensorTempData> temps = [];
    // temps.add(UgSensorTempData(
    //   name: 'barry_hdd',
    //   temp: hddTempLimit,
    //   tempUnit: tempUnit,
    //   tempLimit: hddTempLimit,
    // ));
    // temps.add(UgSensorTempData(
    //   name: 'barry_ssd',
    //   temp: ssdTempLimit,
    //   tempUnit: tempUnit,
    //   tempLimit: ssdTempLimit,
    // ));
    // temps.add(UgSensorTempData(
    //   name: 'barry_cpu',
    //   temp: cpuTempLimit,
    //   tempUnit: tempUnit,
    //   tempLimit: cpuTempLimit,
    // ));
    // if (temps.isNotEmpty) {
    //   onTempsChanged(temps);
    // }

    // _isRequesting = true;
    // try {
    //   // 每轮同时查询温度数据和用户温度单位，确保页面期间切换单位后能自动刷新展示。
    //   final Future<BaseResponse<dynamic>> tempFuture =
    //   UGHardwareAndPowerApi.queryTaskManagerAllStat();
    //   final Future<BaseResponse<dynamic>> unitFuture =
    //   UGHardwareAndPowerApi.queryUserConfig().catchError((dynamic e) {
    //     LogUtil.d('UgSensorTempPollingManager.queryTempUnit: $e');
    //     return BaseResponse<dynamic>();
    //   });
    //
    //   final BaseResponse<dynamic> tempResponse = await tempFuture;
    //   final BaseResponse<dynamic> unitResponse = await unitFuture;
    //   if (_disposed) {
    //     return;
    //   }
    //
    //   if (!tempResponse.isSuccess) {
    //     return;
    //   }
    //
    //   final int tempUnit = parseTempUnit(unitResponse.data);
    //   final List<UgSensorTempData> temps = parseSensorTemps(
    //     tempResponse.data,
    //     tempUnit: tempUnit,
    //   );
    //   if (temps.isNotEmpty) {
    //     onTempsChanged(temps);
    //   }
    // } catch (e) {
    //   print('UgSensorTempPollingManager.refresh: $e');
    // } finally {
    //   _isRequesting = false;
    // }
  }

  /// 释放轮询资源。
  void dispose() {
    _disposed = true;
    _timer?.cancel();
    _timer = null;
  }

  static List<UgSensorTempData> parseSensorTemps(
      dynamic data, {
        int tempUnit = celsiusUnit,
      }) {
    final List<UgSensorTempData> temps = <UgSensorTempData>[];
    final int? cpuTemp = _parseCpuTemp(data);
    if (cpuTemp != null) {
      temps.add(
        UgSensorTempData(
          name: 'CPU',
          temp: cpuTemp,
          tempUnit: tempUnit,
          tempLimit: cpuTempLimit,
        ),
      );
    }
    temps.addAll(_parseDiskTemps(data, tempUnit));
    // temps.removeWhere((item) => item.isOverTemp);
    // if (temps.isNotEmpty) {
    //   temps.add(UgSensorTempData(
    //     name: 'barry_hdd',
    //     temp: hddTempLimit,
    //     tempUnit: tempUnit,
    //     tempLimit: hddTempLimit,
    //   ));
    //   temps.add(UgSensorTempData(
    //     name: 'barry_ssd' ,
    //     temp: ssdTempLimit,
    //     tempUnit: tempUnit,
    //     tempLimit: ssdTempLimit,
    //   ));
    //   temps.add(UgSensorTempData(
    //     name: 'barry_cpu',
    //     temp: cpuTempLimit,
    //     tempUnit: tempUnit,
    //     tempLimit: cpuTempLimit,
    //   ));
    // }
    return temps;
  }

  static int parseTempUnit(dynamic data) {
    if (data is Map) {
      final int? unit = _toInt(data['temperature_unit']);
      if (unit == fahrenheitUnit) {
        return fahrenheitUnit;
      }
    }
    return celsiusUnit;
  }

  /// 格式化温度展示文案。真实温度统一按摄氏度传入，仅在展示时转换单位。
  static String formatTempText(
      num celsius, {
        required bool isTempUnitF,
        bool showUnit = true,
        bool usePlaceholderForZero = false,
      }) {
    final String unit = isTempUnitF ? fahrenheitUnitText : celsiusUnitText;
    if (usePlaceholderForZero && celsius == 0) {
      return showUnit ? ' - $unit' : ' - ';
    }

    final num displayValue = isTempUnitF ? celsius * 9 / 5 + 32 : celsius;
    final String valueText = _formatTempNumber(displayValue);
    return showUnit ? '$valueText$unit' : valueText;
  }

  static String _formatTempNumber(num value) {
    final double doubleValue = value.toDouble();
    if (doubleValue == doubleValue.roundToDouble()) {
      return doubleValue.toInt().toString();
    }
    return doubleValue.toStringAsFixed(1).replaceFirst(RegExp(r'\.0$'), '');
  }

  static int? _parseCpuTemp(dynamic data) {
    if (data is! Map) {
      return null;
    }

    final Map<dynamic, dynamic> source = data;
    final dynamic cpu = source['cpu'];
    final dynamic cpuSeries = cpu is Map ? cpu['series'] : null;
    final int? tempFromSeries = _parseTempFromSeries(cpuSeries, 'temp');
    if (tempFromSeries != null) {
      return tempFromSeries;
    }

    final dynamic overview = source['overview'];
    final dynamic overviewCpu = overview is Map ? overview['cpu'] : null;
    return _parseTempFromSeries(overviewCpu, 'temp');
  }

  static int? _parseTempFromSeries(dynamic series, String key) {
    if (series is! List) {
      return null;
    }
    for (final dynamic item in series) {
      if (item is Map && item.containsKey(key)) {
        return _toTemperature(item[key]);
      }
    }
    return null;
  }

  static List<UgSensorTempData> _parseDiskTemps(
      dynamic data,
      int tempUnit,
      ) {
    if (data is! Map) {
      return <UgSensorTempData>[];
    }
    final Map<dynamic, dynamic> source = data;
    final dynamic disk = source['disk'];
    final dynamic diskSeries = disk is Map ? disk['series'] : null;
    if (diskSeries is! List) {
      return <UgSensorTempData>[];
    }

    final List<UgSensorTempData> temps = <UgSensorTempData>[];
    for (final dynamic item in diskSeries) {
      if (item is! Map || item['name'] == 'overview') {
        continue;
      }
      final int? temp = _toTemperature(item['temperature']);
      if (temp == null) {
        continue;
      }

      final String name = (item['label'] as String?) ?? '';
      temps.add(
        UgSensorTempData(
          name: name,
          temp: temp,
          tempUnit: tempUnit,
          tempLimit: _resolveDiskTempLimit(item),
        ),
      );
    }
    return temps;
  }

  static int _resolveDiskTempLimit(Map<dynamic, dynamic> disk) {
    if (_isSsdDisk(disk)) {
      return ssdTempLimit;
    }
    return hddTempLimit;
  }

  static bool _isSsdDisk(Map<dynamic, dynamic> disk) {
    final int? type = _toInt(disk['type']);
    final dynamic interfaceType = disk['interface_type'];
    return interfaceType == 'u2' ||
        type == 1 ||
        type == 2 ||
        type == 4 ||
        type == 6;
  }

  static int? _toInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  static int? _toTemperature(dynamic value) {
    if (value is num) {
      return value.round();
    }
    if (value is String) {
      return num.tryParse(value)?.round();
    }
    return null;
  }
}
