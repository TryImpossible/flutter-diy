import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'i18n.gen.dart';

part 'ug_fan_config.g.dart';

Rx<UgFanConfig> fanConfig = UgFanConfig.empty().obs;

enum FanMode {
  //初始化，还没查询
  none(0),
  //2：自动, ui上是第一个
  automatic(2),
  //1:静音
  mute(1),
  //3：全速
  fullSpeed(3),
  //4：自定义
  custom(4);

  final int value;

  const FanMode(this.value);

  static valueOf(int value) {
    if (value < 0 || value >= FanMode.values.length) {
      return none;
    }
    FanMode mode = none;
    FanMode.values.forEach((element) {
      if (element.value == value) {
        mode = element;
      }
    });
    return mode;
  }
}

/// 风扇类型
enum FanType {
  // 设备风扇
  equipment(0),

  // CPU风扇
  cpu(1);

  const FanType(this.value);

  final int value;

  @override
  String toString() {
    switch (this) {
      case equipment:
        return UgI18nCP.fanEquipment.trcp;
      case cpu:
        return UgI18nCP.fanCpu.trcp;
    }
  }
}

/// 冷却风扇配置。
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.none)
class UgFanConfig {
  UgFanConfig({
    required this.mode,
    required this.supportCustom,
    required this.hasSysFan,
    required this.hasCpuFan,
    required this.sysFanTable,
    required this.cpuFanTable,
  });

  factory UgFanConfig.fromJson(Map<String, dynamic> json) {
    final UgFanConfig config = _$UgFanConfigFromJson(json);
    if (!json.containsKey('mode')) {
      config.mode = json['result'] as int? ?? config.mode;
    }
    return config;
  }

  factory UgFanConfig.empty() => UgFanConfig(
    mode: 0,
    supportCustom: false,
    hasSysFan: false,
    hasCpuFan: false,
    sysFanTable: <List<int>>[],
    cpuFanTable: <List<int>>[],
  );

  /// 风扇模式：1 静音，2 普通，3 全速，4 自定义。
  @JsonKey(defaultValue: 0)
  int mode;

  /// 是否支持自定义风扇曲线。
  @JsonKey(name: 'support_custom')
  bool? supportCustom;

  /// 是否存在系统风扇。
  @JsonKey(name: 'has_sys_fan')
  bool? hasSysFan;

  /// 是否存在 CPU 风扇。
  @JsonKey(name: 'has_cpu_fan')
  bool? hasCpuFan;

  /// 系统风扇曲线坐标，元素格式为 [温度, 转速百分比]。
  @JsonKey(name: 'sys_fan_table')
  List<List<int>>? sysFanTable;

  /// CPU 风扇曲线坐标，元素格式为 [温度, 转速百分比]。
  @JsonKey(name: 'cpu_fan_table')
  List<List<int>>? cpuFanTable;

  UgFanConfig copyWith({
    int? mode,
    bool? supportCustom,
    bool? hasSysFan,
    bool? hasCpuFan,
    List<List<int>>? sysFanTable,
    List<List<int>>? cpuFanTable,
  }) =>
      UgFanConfig(
        mode: mode ?? this.mode,
        supportCustom: supportCustom ?? this.supportCustom,
        hasSysFan: hasSysFan ?? this.hasSysFan,
        hasCpuFan: hasCpuFan ?? this.hasCpuFan,
        sysFanTable: sysFanTable ?? this.sysFanTable,
        cpuFanTable: cpuFanTable ?? this.cpuFanTable,
      );

  Map<String, dynamic> toJson() => _$UgFanConfigToJson(this);

  Map<String, dynamic> toRequestJson({bool includeFanTables = false}) {
    final Map<String, dynamic> json = <String, dynamic>{
      'mode': mode,
    };
    if (includeFanTables) {
      json['sys_fan_table'] = sysFanTable;
      json['cpu_fan_table'] = cpuFanTable;
    }
    return json;
  }
}
