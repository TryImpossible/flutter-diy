abstract class UgI18nCP {
  /// key: fan_chart_full_speed
  /// 中文: 全速
  /// 英文: Full speed
  static const String fanChartFullSpeed = '全速';

  /// key: fan_chart_hdd_temp_warning
  /// 中文: %s温度已达阈值上限，超限区间转速不可调整
  /// 英文: %s hits its temp limit, over-limit fan speed is locked
  static const String fanChartHddTempWarning = '%s温度已达阈值上限，超限区间转速不可调整';

  /// key: fan_chart_tooltip
  /// 中文: %1$s温度达到%2$s°C时，\n风扇转速设置为%3$s%
  /// 英文: %1$s reaches %2$s°C, \nset fan speed to %3$s%
  static const String fanChartTooltip = 'fan_chart_tooltip';

  /// key: fan_control
  /// 中文: 冷却风扇
  /// 英文: Cooling fan
  static const String fanControl = '冷却风扇';

  /// key: fan_cpu
  /// 中文: CPU风扇
  /// 英文: CPU fan
  static const String fanCpu = 'CPU风扇';

  /// key: fan_curve_reset
  /// 中文: 重置
  /// 英文: Reset
  static const String fanCurveReset = '重置';

  /// key: fan_custom
  /// 中文: 自定义
  /// 英文: Custom
  static const String fanCustom = '自定义';

  /// key: fan_equipment
  /// 中文: 设备风扇
  /// 英文: Device fan
  static const String fanEquipment = '设备风扇';

  /// key: fanException
  /// 中文: 风扇故障
  /// 英文: Fan failure
  static const String fanexception = '风扇故障';

  /// key: fan_custom_mode_tips
  /// 中文: 个性化调整各风扇的区间转速
  /// 英文: Customize the speed range for each fan
  static const String fanCustomModeTips = '个性化调整各风扇的区间转速';

  /// key: fan_drag_curve_hint
  /// 中文: 拖动曲线可设置温度区间的风扇转速(PWM)
  /// 英文: Drag the curve to set the fan speed (PWM) for each temperature range
  static const String fanDragCurveHint = '拖动曲线可设置温度区间的风扇转速(PWM)';

  /// key: fan_exception
  /// 中文: 冷却风扇故障
  /// 英文: Fan failure
  static const String fanException = '冷却风扇故障';

  /// key: fan_full_speed_mode_tips
  /// 中文: 风扇全速运行提升散热效率，可能产生较大噪音
  /// 英文: Full-speed fan operation improves cooling but may cause loud noise
  static const String fanFullSpeedModeTips = '风扇全速运行提升散热效率，可能产生较大噪音';

  /// key: fan_general_mode_tips
  /// 中文: 根据系统温度，自动调整风扇转速
  /// 英文: Automatically adjust the fan speed based on the system temperature
  static const String fanGeneralModeTips = '根据系统温度，自动调整风扇转速';

  /// key: fan_mute_mode_tips
  /// 中文: 风扇低速运行降低噪音，散热效率可能降低
  /// 英文: The fan operating at a low speed produces less noise, but the system may become warmer during the process
  static const String fanMuteModeTips = '风扇低速运行降低噪音，散热效率可能降低';

  /// key: fan_speed_curve_setting
  /// 中文: 转速曲线设置
  /// 英文: Speed curve
  static const String fanSpeedCurveSetting = '转速曲线设置';

  /// key: fan_speed_limit_note
  /// 中文: 转速限制：\n1.硬件设备达到对应温度上限后，不可调节超限部分风扇转速\n2.高温区间的风扇转速，不可低于低温区间的风扇转速
  /// 英文: Speed limits:\n1. When a device hits its temp limit, over-limit fan speed is locked\n2. The fan speed set for a high-temperature range cannot be lower than the fan speed set for a low-temperature range
  static const String fanSpeedLimitNote = '转速限制：\n1.硬件设备达到对应温度上限后，不可调节超限部分风扇转速\n2.高温区间的风扇转速，不可低于低温区间的风扇转速';

  /// key: fan_work_mode
  /// 中文: 风扇工作模式
  /// 英文: Work mode
  static const String fanWorkMode = '风扇工作模式';


}

/// 国际化扩展方法
extension UgI18nCPExtension on String {
  /// 获取本地化文本
  String get trcp => this;

  /// 常规带参
  String trfcp(List<Object> args) => trcp.format(args);

  // /// 单复数
  // String trpcp(int quantity, {List<Object>? formatArgs, bool justShowUnit = false}) {
  //   return Localized.quantityText('ug_control_panel.$this', quantity, formatArgs: formatArgs, justShowUnit: justShowUnit);
  // }

  String format(List<Object> args) {
    String result = this;
    // Handle cases like %1$s, %2$s
    result = result.replaceAllMapped(RegExp(r'%(\d+)\$s'), (match) {
      var index =
          int.parse(match[1]!) - 1; // subtract one because arrays are 0-based
      return args.length > index ? args[index].toString() : match[0]!;
    });
    // Handle cases like %s when there is only one argument
    result =
        result.replaceAll('%s', args.isNotEmpty ? args.first.toString() : '%s');
    return result;
  }

}