import 'dart:math' as math;

import 'package:app/custom/fan/dimen_ext.dart';
import 'package:app/custom/fan/ug_fan_config.dart';
import 'package:app/custom/fan/ug_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'font_weight_ext.dart';
import 'i18n.gen.dart';
import 'ug_fan_speed_setting_vm.dart';
import 'ug_sensor_temp_polling_manager.dart';
import 'widget/ug_fan_speed_chart.dart';

/// 单风扇转速曲线设置页
class UGFanSpeedSettingPage extends StatefulWidget {
  const UGFanSpeedSettingPage({
    super.key,
    this.fanType = FanType.equipment,
  });

  final FanType fanType;

  @override
  State<UGFanSpeedSettingPage> createState() => _UGFanSpeedSettingPageState();
}

class _UGFanSpeedSettingPageState extends State<UGFanSpeedSettingPage>
    with
        SingleTickerProviderStateMixin {
  late final UgFanSpeedSettingVM _vm;
  bool _hasPendingCurveSave = false;

  @override
  void initState() {
    super.initState();
    _vm = UgFanSpeedSettingVM(widget.fanType, fanConfig.value);
    _vm.initData();
  }

  @override
  void dispose() {
    if (_hasPendingCurveSave) {
      _savePendingCurveNow();
    }
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.px),
            _SpeedCurveSection(
              vm: _vm,
              onCurveChanged: _markCurveSavePending,
              onCurveEditFinished: _savePendingCurveNow,
              onResetCurve: _saveCurveNow,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.px),
                    _SensorTempSection(vm: _vm),
                    SizedBox(height: 12.px),
                    const _SpeedLimitNote(),
                    SizedBox(
                      height: math.max(
                        12.px,
                        MediaQuery.paddingOf(context).bottom,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _markCurveSavePending() {
    _hasPendingCurveSave = true;
  }

  void _savePendingCurveNow() {
    if (!_hasPendingCurveSave) {
      return;
    }
    _saveCurveNow();
  }

  void _saveCurveNow() {
    _hasPendingCurveSave = false;
    final UgFanConfig newConfig = _vm.buildCustomFanConfig();
    _vm.updateFanConfig(newConfig);
    fanConfig.value = newConfig;
    fanConfig.update((_) {});
  }
}

/// 传感器温度区域
class _SensorTempSection extends StatelessWidget {
  const _SensorTempSection({required this.vm});

  final UgFanSpeedSettingVM vm;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final RxList<UgSensorTempData> sensors = vm.sensorTemps;
      if (sensors.isEmpty) {
        return const SizedBox.shrink();
      }

      return UgSensorMetricGrid<UgSensorTempData>(
        items: sensors.toList(),
        itemBuilder: (BuildContext context, UgSensorTempData sensor) =>
            _SensorTempItem(sensor: sensor),
        resolveItemsInPerRow: (
            BuildContext context,
            List<UgSensorTempData> items,
            double availableWidth,
            double spacing,
            ) {
          if (items.length <= 1 || availableWidth <= spacing) {
            return 1;
          }
          final double twoColumnWidth = (availableWidth - spacing) / 2;
          // 只有所有温度项都能在半宽 item 内单行完整展示，整组才使用两列。
          final bool canUseTwoColumns = items.every(
                (UgSensorTempData sensor) =>
            _SensorTempItem.singleLineWidth(sensor) <= twoColumnWidth,
          );
          return canUseTwoColumns ? 2 : 1;
        },
      );
    });
  }
}

typedef UgSensorMetricGridColumnResolver<T> = int Function(
    BuildContext context,
    List<T> items,
    double availableWidth,
    double spacing,
    );

/// 通用传感器指标网格。
class UgSensorMetricGrid<T> extends StatelessWidget {
  const UgSensorMetricGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.resolveItemsInPerRow,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final UgSensorMetricGridColumnResolver<T> resolveItemsInPerRow;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.px),
        color: UgColors.hex05000000Card.color,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double spacing = 20.px;
            final int resolvedItemsInPerRow = _resolveItemsInPerRow(
              context,
              constraints.maxWidth,
              spacing,
            );
            final double itemWidth =
                (constraints.maxWidth - spacing * (resolvedItemsInPerRow - 1)) /
                    resolvedItemsInPerRow;
            return Wrap(
              spacing: spacing,
              runSpacing: 8.px,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: items.map((T item) {
                Widget current = itemBuilder(context, item);
                if (items.length == 1) {
                  current = Center(child: current);
                } else {
                  current = SizedBox(width: itemWidth, child: current);
                }
                return current;
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  int _resolveItemsInPerRow(
      BuildContext context,
      double availableWidth,
      double spacing,
      ) {
    final int rawItemsInPerRow = resolveItemsInPerRow(
      context,
      items,
      availableWidth,
      spacing,
    );
    final int maxItemsInPerRow = math.max(1, items.length);
    return rawItemsInPerRow.clamp(1, maxItemsInPerRow);
  }
}

/// 传感器温度项
class _SensorTempItem extends StatelessWidget {
  const _SensorTempItem({required this.sensor});

  final UgSensorTempData sensor;
  static double get _iconWidth => 20.px;
  static double get _textSpacing => 8.px;
  static double get _fontSize => 12.sp;

  static double singleLineWidth(UgSensorTempData sensor) {
    return _iconWidth +
        _textSpacing +
        _measureTextWidth(sensor.name) +
        _textSpacing +
        _measureTextWidth(sensor.displayTempText);
  }

  static double _measureTextWidth(String text) {
    final TextPainter painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: _fontSize),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.width;
  }

  @override
  Widget build(BuildContext context) {
    final bool isOverTemp = sensor.isOverTemp;
    final Color tempColor =
    isOverTemp ? UgColors.hexFFFAA21E.color : UgColors.hexD9000000.color;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.px),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (sensor.isCpuTemp)
            Container(
              width: _iconWidth,
              height: _iconWidth,
              color: Colors.redAccent,
            )
          else
            Container(
              width: _iconWidth,
              height: _iconWidth,
              color: Colors.red,
            ),
          SizedBox(width: _textSpacing),
          Flexible(
            child: Text(
              sensor.name,
              style: TextStyle(
                fontSize: _fontSize,
                color: UgColors.hexA6000000.color,
              ),
            ),
          ),
          SizedBox(width: _textSpacing),
          Text(
            sensor.displayTempText,
            style: TextStyle(
              fontSize: _fontSize,
              color: tempColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// 转速曲线设置区域
class _SpeedCurveSection extends StatelessWidget {
  const _SpeedCurveSection({
    required this.vm,
    required this.onCurveChanged,
    required this.onCurveEditFinished,
    required this.onResetCurve,
  });

  final UgFanSpeedSettingVM vm;
  final VoidCallback onCurveChanged;
  final VoidCallback onCurveEditFinished;
  final VoidCallback onResetCurve;
  static final RegExp _wordSeparator = RegExp(r'\s+');
  static const double _defaultYAxisColumnWidth = 35.0;
  static const double _yLabelLeftPadding = 11.0;
  static const double _axisFontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(context),
        SizedBox(height: 4.px),
        _buildSubtitleAndWarningRow(),
        SizedBox(height: 12.px),
        _buildChart(context),
      ],
    );
  }

  /// 标题行（转速曲线设置 + 信息图标）
  Widget _buildTitle(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: UgI18nCP.fanSpeedCurveSetting.trcp,
        children: <InlineSpan>[
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: () {
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.px),
                child: Container(
                  height: 16.px,
                  width: 16.px,
                  color: UgColors.hexFF000000.color,
                ),
              ),
            ),
          )
        ],
      ),
      style: TextStyle(
        fontSize: 14.sp,
        height: 22 / 14,
        color: UgColors.hexD9000000.color,
        fontWeight: FontWeightExt.medium,
      ),
    );
  }

  /// 副标题行：无警告时显示拖动提示，有警告时显示警告文案；右侧条件显示重置按钮
  Widget _buildSubtitleAndWarningRow() {
    return Obx(() {
      final String warningText = vm.tempWarningText.value;
      return AnimatedBuilder(
        animation: vm.curveController,
        builder: (BuildContext context, Widget? child) {
          final bool hasWarning =
              vm.tempWarningLine != null && warningText.isNotEmpty;
          final bool showReset = vm.canResetCurve;

          return Row(
            children: <Widget>[
              Expanded(
                child: hasWarning
                    ? Text(
                  UgI18nCP.fanChartHddTempWarning.trfcp(
                    <String>[warningText],
                  ),
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 20 / 12,
                    color: UgColors.hexFFFAA21E.color,
                  ),
                )
                    : Text(
                  UgI18nCP.fanDragCurveHint.trcp,
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 20 / 12,
                    color: UgColors.hex73000000.color,
                  ),
                ),
              ),
              if (showReset) ...<Widget>[
                SizedBox(width: 8.px),
                _buildResetButton(),
              ],
            ],
          );
        },
      );
    });
  }

  /// 重置按钮
  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {
        vm.resetCurve();
        onResetCurve();
      },
      child: Text(
        UgI18nCP.fanCurveReset.trcp,
        style: TextStyle(
          fontSize: 12.sp,
          height: 20 / 12,
          color: UgColors.hexFF0055FF.color,
        ),
      ),
    );
  }

  /// 图表
  Widget _buildChart(BuildContext context) {
    return Obx(() {
      final bool isTempUnitF = vm.isTempUnitF;
      final String fullSpeedText = UgI18nCP.fanChartFullSpeed.trcp;
      return UgEditableCurveChart(
        controller: vm.curveController,
        style: UgCurveChartStyle(
          yAxisColumnWidth: false
              ? _resolveYAxisColumnWidth(fullSpeedText)
              : _defaultYAxisColumnWidth,
        ),
        xLabelBuilder: (double value) {
          final int temp = value.round();
          final bool showUnit = temp == vm.maxTemperature.round();
          return _formatCurveTempText(
            temp,
            isTempUnitF: isTempUnitF,
            showUnit: showUnit,
          );
        },
        yLabelBuilder: (double value) {
          if (value == vm.maxSpeedPercent) {
            return fullSpeedText;
          }
          if (value == 0) {
            return '';
          }
          return value.round().toString();
        },
        tooltipBuilder: (UgCurvePointData point) {
          final String sensorName = vm.isCpuFan ? 'CPU' : '系统';
          final String tempText = _formatCurveTempText(
            point.x.round(),
            isTempUnitF: isTempUnitF,
          );
          final String tooltip = UgI18nCP.fanChartTooltip.trfcp(<String>[
            sensorName,
            tempText,
            point.y.round().toString(),
          ]);
          return tooltip.replaceFirst('$tempText°C', tempText);
        },
        onPointChanged: (int index, UgCurvePointData point) {
          onCurveChanged();
        },
        onDragEnd: (int index, UgCurvePointData point) {
          onCurveEditFinished();
        },
      );
    });
  }

  double _resolveYAxisColumnWidth(String topLabel) {
    if (topLabel.trim().isEmpty) {
      return _defaultYAxisColumnWidth;
    }
    const TextStyle yLabelStyle = TextStyle(
      fontSize: _axisFontSize,
      height: 1,
      fontWeight: FontWeightExt.regular,
    );
    final double longestWordWidth = _measureLongestWordWidth(
      topLabel,
      yLabelStyle,
    );
    // yAxisColumnWidth 是 UgCurveChartStyle 的设计值，组件内部会统一做 px 适配。
    return math.max(
      _defaultYAxisColumnWidth,
      _yLabelLeftPadding + longestWordWidth,
    );
  }

  double _measureLongestWordWidth(String text, TextStyle style) {
    final List<String> words = text
        .trim()
        .split(_wordSeparator)
        .where((String word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) {
      return 0;
    }
    return words
        .map((String word) => _measureTextWidth(word, style))
        .reduce(math.max);
  }

  double _measureTextWidth(String text, TextStyle style) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return painter.width;
  }

  String _formatCurveTempText(
      num temp, {
        required bool isTempUnitF,
        bool showUnit = true,
      }) {
    return UgSensorTempPollingManager.formatTempText(
      temp,
      isTempUnitF: isTempUnitF,
      showUnit: showUnit,
    );
  }
}

/// 转速限制说明
class _SpeedLimitNote extends StatelessWidget {
  const _SpeedLimitNote();

  @override
  Widget build(BuildContext context) {
    return Text(
      UgI18nCP.fanSpeedLimitNote.trcp,
      style: TextStyle(
        fontSize: 12.sp,
        height: 20 / 12,
        color: UgColors.hex73000000.color,
      ),
    );
  }
}
