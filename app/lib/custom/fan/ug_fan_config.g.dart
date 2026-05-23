// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ug_fan_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UgFanConfig _$UgFanConfigFromJson(Map<String, dynamic> json) => UgFanConfig(
  mode: json['mode'] as int? ?? 0,
  supportCustom: json['support_custom'] as bool?,
  hasSysFan: json['has_sys_fan'] as bool?,
  hasCpuFan: json['has_cpu_fan'] as bool?,
  sysFanTable: (json['sys_fan_table'] as List<dynamic>?)
      ?.map((e) =>
      (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
  cpuFanTable: (json['cpu_fan_table'] as List<dynamic>?)
      ?.map((e) =>
      (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
);

Map<String, dynamic> _$UgFanConfigToJson(UgFanConfig instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'support_custom': instance.supportCustom,
      'has_sys_fan': instance.hasSysFan,
      'has_cpu_fan': instance.hasCpuFan,
      'sys_fan_table': instance.sysFanTable,
      'cpu_fan_table': instance.cpuFanTable,
    };
