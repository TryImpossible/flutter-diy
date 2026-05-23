import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../dimen_ext.dart';

import '../font_weight_ext.dart';
import '../ug_theme.dart';
import 'ug_curve_controller.dart';

export 'ug_curve_controller.dart';

typedef UgCurveTooltipBuilder = String Function(UgCurvePointData point);
typedef UgCurveLabelBuilder = String Function(double value);
typedef UgCurvePointCallback = void Function(int index, UgCurvePointData point);
typedef UgCurveDragCallback = void Function(int index, UgCurvePointData point);

/// 曲线图视觉配置。
@immutable
class UgCurveChartStyle {
  const UgCurveChartStyle({
    double yAxisColumnWidth = 35.0,
    double bottomAxisHeight = 28.0,
    double chartTopInset = 10.0,
    double axisFontSize = 12.0,
    double tooltipFontSize = 12.0,
    Color? axisLabelColor,
    Color? tooltipTextColor,
    Color? gridLineColor,
    Color? rangeBandFillColor,
    Color? rangeBandBorderColor,
    Color? guideLineColor,
    Color? warningLineColor,
    Color? curveLineColor,
    Color? pointFillColor,
    Color? pointStrokeColor,
    Color? tooltipBackgroundColor,
    Color? tooltipShadowColor,
  }) : _yAxisColumnWidth = yAxisColumnWidth,
       _bottomAxisHeight = bottomAxisHeight,
       _chartTopInset = chartTopInset,
       _axisFontSize = axisFontSize,
       _tooltipFontSize = tooltipFontSize,
       _axisLabelColor = axisLabelColor,
       _tooltipTextColor = tooltipTextColor,
       _gridLineColor = gridLineColor,
       _rangeBandFillColor = rangeBandFillColor,
       _rangeBandBorderColor = rangeBandBorderColor,
       _guideLineColor = guideLineColor,
       _warningLineColor = warningLineColor,
       _curveLineColor = curveLineColor,
       _pointFillColor = pointFillColor,
       _pointStrokeColor = pointStrokeColor,
       _tooltipBackgroundColor = tooltipBackgroundColor,
       _tooltipShadowColor = tooltipShadowColor;

  final double _yAxisColumnWidth;
  final double _bottomAxisHeight;
  final double _chartTopInset;
  final double _axisFontSize;
  final double _tooltipFontSize;
  final Color? _axisLabelColor;
  final Color? _tooltipTextColor;
  final Color? _gridLineColor;
  final Color? _rangeBandFillColor;
  final Color? _rangeBandBorderColor;
  final Color? _guideLineColor;
  final Color? _warningLineColor;
  final Color? _curveLineColor;
  final Color? _pointFillColor;
  final Color? _pointStrokeColor;
  final Color? _tooltipBackgroundColor;
  final Color? _tooltipShadowColor;

  /// Y 轴文案列宽，返回已适配 px 后的值。
  double get yAxisColumnWidth => _yAxisColumnWidth.px;

  /// X 轴文案区高度，返回已适配 px 后的值。
  double get bottomAxisHeight => _bottomAxisHeight.px;

  /// 图表顶部预留高度，返回已适配 px 后的值。
  double get chartTopInset => _chartTopInset.px;

  /// 坐标轴字号，返回已适配 sp 后的值。
  double get axisFontSize => _axisFontSize.sp;

  /// 提示框字号，返回已适配 sp 后的值。
  double get tooltipFontSize => _tooltipFontSize.sp;

  Color get axisLabelColor => _axisLabelColor ?? UgColors.hex40000000.color;

  Color get tooltipTextColor => _tooltipTextColor ?? UgColors.hexD9000000.color;

  Color get gridLineColor => _gridLineColor ?? UgColors.hex0F000000.color;

  Color get rangeBandFillColor =>
      _rangeBandFillColor ?? UgColors.hex0A24B33CChartRangeBandFill.color;

  Color get rangeBandBorderColor =>
      _rangeBandBorderColor ?? UgColors.hex8024B33CChartRangeBandBorder.color;

  Color get guideLineColor =>
      _guideLineColor ?? UgColors.hex400055FFChartGuideLine.color;

  Color get warningLineColor => _warningLineColor ?? UgColors.hexFFFAA21E.color;

  Color get curveLineColor =>
      _curveLineColor ?? UgColors.hexFF0055FFChartPolylineLine.color;

  Color get pointFillColor => _pointFillColor ?? UgColors.hexFFFFFFFF.color;

  Color get pointStrokeColor => _pointStrokeColor ?? UgColors.hexFF0055FF.color;

  Color get tooltipBackgroundColor =>
      _tooltipBackgroundColor ?? UgColors.hexFFFFFFFFBubbleCard.color;

  Color get tooltipShadowColor =>
      _tooltipShadowColor ?? UgColors.hex24262626ChartTooltipShadow.color;

  int get signature => Object.hashAll(<Object>[
    yAxisColumnWidth,
    bottomAxisHeight,
    chartTopInset,
    axisFontSize,
    tooltipFontSize,
    axisLabelColor,
    tooltipTextColor,
    gridLineColor,
    rangeBandFillColor,
    rangeBandBorderColor,
    guideLineColor,
    warningLineColor,
    curveLineColor,
    pointFillColor,
    pointStrokeColor,
    tooltipBackgroundColor,
    tooltipShadowColor,
  ]);
}

/// 通用可编辑曲线图。
class UgEditableCurveChart extends StatefulWidget {
  const UgEditableCurveChart({
    super.key,
    required this.controller,
    required this.tooltipBuilder,
    this.style = const UgCurveChartStyle(),
    this.xLabelBuilder,
    this.yLabelBuilder,
    this.onPointChanged,
    this.onDragStart,
    this.onDragEnd,
  });

  final UgCurveController controller;
  final UgCurveChartStyle style;
  final UgCurveTooltipBuilder tooltipBuilder;
  final UgCurveLabelBuilder? xLabelBuilder;
  final UgCurveLabelBuilder? yLabelBuilder;
  final UgCurvePointCallback? onPointChanged;
  final UgCurveDragCallback? onDragStart;
  final UgCurveDragCallback? onDragEnd;

  @override
  State<UgEditableCurveChart> createState() => _UgEditableCurveChartState();
}

class _UgEditableCurveChartState extends State<UgEditableCurveChart> {
  static const double _plotHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final _CurveChartMetrics metrics = _CurveChartMetrics(
          width: constraints.maxWidth,
          plotHeight: _plotHeight.px,
          yAxisColumnWidth: widget.style.yAxisColumnWidth,
          bottomAxisHeight: widget.style.bottomAxisHeight,
          chartTopInset: widget.style.chartTopInset,
          axisConfig: widget.controller.axisConfig,
        );

        return SizedBox(
          width: metrics.width,
          height: metrics.totalHeight,
          child: Stack(
            children: <Widget>[
              RepaintBoundary(
                child: CustomPaint(
                  size: metrics.size,
                  painter: _CurveBackgroundPainter(
                    axisConfig: widget.controller.axisConfig,
                    style: widget.style,
                    styleSignature: widget.style.signature,
                    metrics: metrics,
                    xLabelBuilder: widget.xLabelBuilder,
                    yLabelBuilder: widget.yLabelBuilder,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: widget.controller,
                builder: (BuildContext context, Widget? child) {
                  return RepaintBoundary(
                    child: CustomPaint(
                      size: metrics.size,
                      painter: _CurveForegroundPainter(
                        points: widget.controller.points,
                        axisConfig: widget.controller.axisConfig,
                        constraintConfig: widget.controller.constraintConfig,
                        draggingIndex: widget.controller.draggingIndex,
                        activeRange: widget.controller.activeRange,
                        warningX: widget.controller.warningX,
                        tooltipBuilder: widget.tooltipBuilder,
                        style: widget.style,
                        styleSignature: widget.style.signature,
                        metrics: metrics,
                      ),
                    ),
                  );
                },
              ),
              Positioned.fill(
                child: _CurveGestureLayer(
                  controller: widget.controller,
                  metrics: metrics,
                  onPointChanged: widget.onPointChanged,
                  onDragStart: widget.onDragStart,
                  onDragEnd: widget.onDragEnd,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

@immutable
class _CurveChartMetrics {
  factory _CurveChartMetrics({
    required double width,
    required double plotHeight,
    required double yAxisColumnWidth,
    required double bottomAxisHeight,
    required double chartTopInset,
    required UgCurveAxisConfig axisConfig,
  }) {
    final double plotWidth = math.max(0.0, width - yAxisColumnWidth);
    final Rect chartArea = Rect.fromLTWH(
      0,
      chartTopInset,
      plotWidth,
      plotHeight,
    );
    return _CurveChartMetrics._(
      width: width,
      plotHeight: plotHeight,
      plotWidth: plotWidth,
      yAxisColumnWidth: yAxisColumnWidth,
      bottomAxisHeight: bottomAxisHeight,
      chartTopInset: chartTopInset,
      axisConfig: axisConfig,
      chartArea: chartArea,
      mapper: _CurveCoordMapper(chartArea: chartArea, axisConfig: axisConfig),
    );
  }

  const _CurveChartMetrics._({
    required this.width,
    required this.plotHeight,
    required this.plotWidth,
    required this.yAxisColumnWidth,
    required this.bottomAxisHeight,
    required this.chartTopInset,
    required this.axisConfig,
    required this.chartArea,
    required this.mapper,
  });

  final double width;
  final double plotHeight;
  final double plotWidth;
  final double yAxisColumnWidth;
  final double bottomAxisHeight;
  final double chartTopInset;
  final UgCurveAxisConfig axisConfig;
  final Rect chartArea;
  final _CurveCoordMapper mapper;

  double get totalHeight => chartTopInset + plotHeight + bottomAxisHeight;

  Size get size => Size(width, totalHeight);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _CurveChartMetrics &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          plotHeight == other.plotHeight &&
          plotWidth == other.plotWidth &&
          yAxisColumnWidth == other.yAxisColumnWidth &&
          bottomAxisHeight == other.bottomAxisHeight &&
          chartTopInset == other.chartTopInset &&
          axisConfig == other.axisConfig;

  @override
  int get hashCode => Object.hash(
    width,
    plotHeight,
    plotWidth,
    yAxisColumnWidth,
    bottomAxisHeight,
    chartTopInset,
    axisConfig,
  );
}

class _CurveGestureLayer extends StatefulWidget {
  const _CurveGestureLayer({
    required this.controller,
    required this.metrics,
    required this.onPointChanged,
    required this.onDragStart,
    required this.onDragEnd,
  });

  final UgCurveController controller;
  final _CurveChartMetrics metrics;
  final UgCurvePointCallback? onPointChanged;
  final UgCurveDragCallback? onDragStart;
  final UgCurveDragCallback? onDragEnd;

  @override
  State<_CurveGestureLayer> createState() => _CurveGestureLayerState();
}

class _CurveGestureLayerState extends State<_CurveGestureLayer> {
  double? _dragStartDataY;
  double? _dragStartPointY;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (DragStartDetails details) => _onPanStart(context, details),
      onPanUpdate: (DragUpdateDetails details) =>
          _onPanUpdate(context, details),
      onPanEnd: _onPanEnd,
      onPanCancel: _onPanCancel,
      child: const SizedBox.expand(),
    );
  }

  void _onPanStart(BuildContext context, DragStartDetails details) {
    _clearDragStart();
    final Offset? localPos = _globalToLocal(context, details.globalPosition);
    if (localPos == null) {
      return;
    }

    final _CurveCoordMapper mapper = widget.metrics.mapper;
    final List<UgCurvePointData> points = widget.controller.points;
    final _CurveHitTester hitTester = _CurveHitTester(mapper: mapper);
    final int? hitIndex = hitTester.findHitPoint(localPos, points);
    if (hitIndex == null) {
      return;
    }

    final bool started = widget.controller.startDrag(hitIndex);
    if (started) {
      final ({double x, double y}) data = mapper.toData(localPos);
      _dragStartDataY = data.y;
      _dragStartPointY = points[hitIndex].y;
      widget.onDragStart?.call(hitIndex, points[hitIndex]);
    }
  }

  void _onPanUpdate(BuildContext context, DragUpdateDetails details) {
    final int? draggingIndex = widget.controller.draggingIndex;
    if (draggingIndex == null) {
      return;
    }

    final Offset? localPos = _globalToLocal(context, details.globalPosition);
    if (localPos == null) {
      return;
    }

    final double? dragStartDataY = _dragStartDataY;
    final double? dragStartPointY = _dragStartPointY;
    if (dragStartDataY == null || dragStartPointY == null) {
      return;
    }

    final ({double x, double y}) data = widget.metrics.mapper.toData(localPos);
    final double targetPointY = dragStartPointY + data.y - dragStartDataY;
    final bool changed = widget.controller.updateDragByDataY(targetPointY);
    if (changed) {
      widget.onPointChanged?.call(
        draggingIndex,
        widget.controller.pointAt(draggingIndex),
      );
    }
  }

  void _onPanEnd(DragEndDetails details) {
    final int? draggingIndex = widget.controller.draggingIndex;
    UgCurvePointData? point;
    if (draggingIndex != null &&
        draggingIndex >= 0 &&
        draggingIndex < widget.controller.pointCount) {
      point = widget.controller.pointAt(draggingIndex);
    }
    widget.controller.endDrag();
    _clearDragStart();
    if (draggingIndex != null && point != null) {
      widget.onDragEnd?.call(draggingIndex, point);
    }
  }

  void _onPanCancel() {
    widget.controller.endDrag();
    _clearDragStart();
  }

  Offset? _globalToLocal(BuildContext context, Offset globalPosition) {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) {
      return null;
    }
    return renderObject.globalToLocal(globalPosition);
  }

  void _clearDragStart() {
    _dragStartDataY = null;
    _dragStartPointY = null;
  }
}

class _CurveHitTester {
  const _CurveHitTester({required this.mapper});

  final _CurveCoordMapper mapper;

  int? findHitPoint(Offset position, List<UgCurvePointData> points) {
    if (points.isEmpty ||
        position.dx < mapper.chartArea.left ||
        position.dx > mapper.chartArea.right) {
      return null;
    }
    if (points.length == 1) {
      return 0;
    }

    // 命中只看 X 轴分区：相邻控制点的屏幕 X 中点作为边界。
    // 边界点归右侧控制点，符合 0-5 命中左点、5-10 命中右点的交互预期。
    double leftBoundary = mapper.chartArea.left;
    for (int i = 0; i < points.length; i++) {
      final double rightBoundary = i == points.length - 1
          ? mapper.chartArea.right
          : _midpointX(points[i], points[i + 1]);
      final bool hit = i == points.length - 1
          ? position.dx <= rightBoundary
          : position.dx < rightBoundary;
      if (position.dx >= leftBoundary && hit) {
        return i;
      }
      leftBoundary = rightBoundary;
    }
    return null;
  }

  double _midpointX(UgCurvePointData left, UgCurvePointData right) {
    final double leftX = mapper.toScreen(left.x, left.y).dx;
    final double rightX = mapper.toScreen(right.x, right.y).dx;
    return (leftX + rightX) / 2;
  }
}

class _CurveCoordMapper {
  const _CurveCoordMapper({required this.chartArea, required this.axisConfig});

  final Rect chartArea;
  final UgCurveAxisConfig axisConfig;

  Offset toScreen(double x, double y) {
    final double xRatio =
        (x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX);
    final double yRatio =
        (y - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY);
    return Offset(
      chartArea.left + xRatio * chartArea.width,
      chartArea.top + (1 - yRatio) * chartArea.height,
    );
  }

  ({double x, double y}) toData(Offset screen) {
    final double xRatio = (screen.dx - chartArea.left) / chartArea.width;
    final double yRatio = 1 - (screen.dy - chartArea.top) / chartArea.height;
    return (
      x: axisConfig.minX + xRatio * (axisConfig.maxX - axisConfig.minX),
      y: axisConfig.minY + yRatio * (axisConfig.maxY - axisConfig.minY),
    );
  }
}

class _CurveBackgroundPainter extends CustomPainter {
  const _CurveBackgroundPainter({
    required this.axisConfig,
    required this.style,
    required this.styleSignature,
    required this.metrics,
    required this.xLabelBuilder,
    required this.yLabelBuilder,
  });

  final UgCurveAxisConfig axisConfig;
  final UgCurveChartStyle style;
  final int styleSignature;
  final _CurveChartMetrics metrics;
  final UgCurveLabelBuilder? xLabelBuilder;
  final UgCurveLabelBuilder? yLabelBuilder;

  static double get yLabelLeftPadding => 11.px;

  Rect get _chartArea => metrics.chartArea;

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas);
    _drawAxisLabels(canvas);
  }

  void _drawGrid(Canvas canvas) {
    final Paint paint = Paint()
      ..color = style.gridLineColor
      ..strokeWidth = 1.px;

    for (int i = 0; i <= axisConfig.ySteps; i++) {
      final double y =
          _chartArea.top + _chartArea.height * i / axisConfig.ySteps;
      final Offset start = Offset(_chartArea.left, y);
      final Offset end = Offset(_chartArea.right, y);
      if (i == axisConfig.ySteps) {
        canvas.drawLine(start, end, paint);
      } else {
        _drawDashedLine(canvas, start, end, paint);
      }
    }

    for (int i = 0; i <= axisConfig.xSteps; i++) {
      final double x =
          _chartArea.left + _chartArea.width * i / axisConfig.xSteps;
      final Offset start = Offset(x, _chartArea.top);
      final Offset end = Offset(x, _chartArea.bottom);
      if (i == 0) {
        canvas.drawLine(start, end, paint);
      } else {
        _drawDashedLine(canvas, start, end, paint);
      }
    }
  }

  void _drawAxisLabels(Canvas canvas) {
    final TextStyle labelStyle = TextStyle(
      color: style.axisLabelColor,
      fontSize: style.axisFontSize,
      height: 20 / 12,
      fontWeight: FontWeightExt.regular,
    );
    final double xLabelY =
        _chartArea.bottom + (metrics.bottomAxisHeight - 20.px) / 2;
    for (int i = 0; i <= axisConfig.xSteps; i++) {
      final double value =
          axisConfig.minX +
          (axisConfig.maxX - axisConfig.minX) * i / axisConfig.xSteps;
      final double x =
          _chartArea.left + _chartArea.width * i / axisConfig.xSteps;
      _drawText(
        canvas,
        _formatXLabel(value),
        Offset(x, xLabelY),
        labelStyle,
        alignment: i == 0 ? Alignment.topLeft : Alignment.topCenter,
      );
    }

    final TextStyle yLabelStyle = labelStyle.copyWith(height: 1);
    final double yLabelX = _chartArea.right + yLabelLeftPadding;
    final double fullSpeedLabelMaxWidth = metrics.yAxisColumnWidth;
    for (int i = 0; i <= axisConfig.ySteps; i++) {
      final double value =
          axisConfig.maxY -
          (axisConfig.maxY - axisConfig.minY) * i / axisConfig.ySteps;
      final bool isTopYLabel = i == 0;
      final String label = _formatYLabel(value);
      if (label.isEmpty) {
        continue;
      }
      final double y =
          _chartArea.top + _chartArea.height * i / axisConfig.ySteps;
      _drawText(
        canvas,
        label,
        Offset(yLabelX, y),
        yLabelStyle,
        alignment: Alignment.centerLeft,
        maxWidth: isTopYLabel ? fullSpeedLabelMaxWidth : null,
      );
    }
  }

  String _formatXLabel(double value) {
    final UgCurveLabelBuilder? builder = xLabelBuilder;
    if (builder != null) {
      return builder(value);
    }
    return value.round().toString();
  }

  String _formatYLabel(double value) {
    final UgCurveLabelBuilder? builder = yLabelBuilder;
    if (builder != null) {
      return builder(value);
    }
    if (value == axisConfig.minY) {
      return '';
    }
    return value.round().toString();
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset position,
    TextStyle style, {
    Alignment alignment = Alignment.center,
    double? maxWidth,
  }) {
    final TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth ?? double.infinity);
    painter.paint(
      canvas,
      Offset(
        position.dx - painter.width * (alignment.x + 1) / 2,
        position.dy - painter.height * (alignment.y + 1) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _CurveBackgroundPainter oldDelegate) =>
      oldDelegate.axisConfig != axisConfig ||
      oldDelegate.styleSignature != styleSignature ||
      oldDelegate.metrics != metrics ||
      oldDelegate.xLabelBuilder != xLabelBuilder ||
      oldDelegate.yLabelBuilder != yLabelBuilder;
}

class _CurveControlPointVisibility {
  const _CurveControlPointVisibility._();

  static bool shouldDraw({
    required List<UgCurvePointData> points,
    required int index,
    required int? draggingIndex,
    required bool Function(UgCurvePointData point) isLocked,
  }) {
    if (index < 0 || index >= points.length || isLocked(points[index])) {
      return false;
    }
    if (index == 0 || index == points.length - 1) {
      return true;
    }
    return index == draggingIndex || isTurningPoint(points, index);
  }

  static bool isTurningPoint(List<UgCurvePointData> points, int index) {
    if (index <= 0 || index >= points.length - 1) {
      return false;
    }

    final UgCurvePointData left = points[index - 1];
    final UgCurvePointData point = points[index];
    final UgCurvePointData right = points[index + 1];
    final double leftWidth = point.x - left.x;
    final double rightWidth = right.x - point.x;
    if (leftWidth.abs() < 1e-9 || rightWidth.abs() < 1e-9) {
      return false;
    }

    final double leftSlope = (point.y - left.y) / leftWidth;
    final double rightSlope = (right.y - point.y) / rightWidth;
    return (leftSlope - rightSlope).abs() > 1e-9;
  }
}

class _CurveWarningPath {
  const _CurveWarningPath._();

  static UgCurvePointData warningPoint({
    required double warningX,
    required double maxY,
  }) {
    return UgCurvePointData(x: warningX, y: maxY, locked: true);
  }

  static int? previousAnchorIndex({
    required List<UgCurvePointData> points,
    required double warningX,
    required bool Function(UgCurvePointData point) isLocked,
  }) {
    if (points.isEmpty ||
        points.first.x >= warningX ||
        isLocked(points.first)) {
      return null;
    }

    int? anchorIndex;
    for (int i = 1; i < points.length - 1; i++) {
      final UgCurvePointData point = points[i];
      if (point.x >= warningX) {
        break;
      }
      if (isLocked(point)) {
        continue;
      }
      if (_CurveControlPointVisibility.isTurningPoint(points, i)) {
        anchorIndex = i;
      }
    }
    return anchorIndex ?? 0;
  }
}

class _CurveForegroundPainter extends CustomPainter {
  const _CurveForegroundPainter({
    required this.points,
    required this.axisConfig,
    required this.constraintConfig,
    required this.draggingIndex,
    required this.activeRange,
    required this.warningX,
    required this.tooltipBuilder,
    required this.style,
    required this.styleSignature,
    required this.metrics,
  });

  final List<UgCurvePointData> points;
  final UgCurveAxisConfig axisConfig;
  final UgCurveConstraintConfig constraintConfig;
  final int? draggingIndex;
  final UgCurveRange? activeRange;
  final double? warningX;
  final UgCurveTooltipBuilder tooltipBuilder;
  final UgCurveChartStyle style;
  final int styleSignature;
  final _CurveChartMetrics metrics;

  Rect get _chartArea => metrics.chartArea;

  _CurveCoordMapper get _coord => metrics.mapper;

  @override
  void paint(Canvas canvas, Size size) {
    _drawWarningLine(canvas);
    if (draggingIndex != null && activeRange != null) {
      _drawDragRangeAndGuide(canvas);
    }
    _drawPolylineCurve(canvas);
    _drawControlPoints(canvas);
    if (draggingIndex != null) {
      _drawTooltip(canvas, size);
    }
  }

  Offset _toScreen(double x, double y) => _coord.toScreen(x, y);

  bool _isLocked(UgCurvePointData point) {
    final double? maxEditableX = constraintConfig.maxEditableX;
    return point.locked || (maxEditableX != null && point.x > maxEditableX);
  }

  void _drawWarningLine(Canvas canvas) {
    final double? xValue = warningX;
    if (xValue == null) {
      return;
    }
    final double x = _toScreen(
      xValue,
      axisConfig.minY,
    ).dx.clamp(_chartArea.left, _chartArea.right);
    canvas.drawLine(
      Offset(x, _chartArea.top),
      Offset(x, _chartArea.bottom),
      Paint()
        ..color = style.warningLineColor
        ..strokeWidth = 1.px,
    );
  }

  void _drawDragRangeAndGuide(Canvas canvas) {
    final int? index = draggingIndex;
    final UgCurveRange? range = activeRange;
    if (index == null || range == null || index >= points.length) {
      return;
    }
    final UgCurvePointData point = points[index];
    final Offset position = _toScreen(point.x, point.y);

    double bandRight = _chartArea.right;
    final double? xValue = warningX;
    if (xValue != null) {
      bandRight = _toScreen(
        xValue,
        axisConfig.minY,
      ).dx.clamp(_chartArea.left, _chartArea.right);
    }

    final double topY = _toScreen(axisConfig.minX, range.max).dy;
    final double bottomY = _toScreen(axisConfig.minX, range.min).dy;
    final double bandTop = math.min(topY, bottomY);
    final double bandBottom = math.max(topY, bottomY);
    canvas.drawRect(
      Rect.fromLTRB(_chartArea.left, bandTop, bandRight, bandBottom),
      Paint()..color = style.rangeBandFillColor,
    );

    final Paint edgePaint = Paint()
      ..color = style.rangeBandBorderColor
      ..strokeWidth = 1.px;
    canvas.drawLine(
      Offset(_chartArea.left, bandTop),
      Offset(bandRight, bandTop),
      edgePaint,
    );
    canvas.drawLine(
      Offset(_chartArea.left, bandBottom),
      Offset(bandRight, bandBottom),
      edgePaint,
    );

    _drawDashedLine(
      canvas,
      Offset(position.dx, _chartArea.top),
      Offset(position.dx, _chartArea.bottom),
      Paint()
        ..color = style.guideLineColor
        ..strokeWidth = 1.px,
    );
  }

  void _drawPolylineCurve(Canvas canvas) {
    if (points.length < 2) {
      return;
    }

    final Paint solidPaint = Paint()
      ..color = style.curveLineColor
      ..strokeWidth = 1.px
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final Paint dashedPaint = Paint()
      ..color = style.curveLineColor
      ..strokeWidth = 1.px
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double? warning = warningX;
    if (warning == null) {
      _drawPolylineSegments(canvas, points, solidPaint);
      return;
    }
    _drawWarningPolylineCurve(canvas, warning, solidPaint, dashedPaint);
  }

  void _drawPolylineSegments(
    Canvas canvas,
    List<UgCurvePointData> segmentPoints,
    Paint paint,
  ) {
    for (int i = 0; i < segmentPoints.length - 1; i++) {
      canvas.drawLine(
        _toScreen(segmentPoints[i].x, segmentPoints[i].y),
        _toScreen(segmentPoints[i + 1].x, segmentPoints[i + 1].y),
        paint,
      );
    }
  }

  void _drawWarningPolylineCurve(
    Canvas canvas,
    double warning,
    Paint solidPaint,
    Paint dashedPaint,
  ) {
    final int? anchorIndex = _CurveWarningPath.previousAnchorIndex(
      points: points,
      warningX: warning,
      isLocked: _isLocked,
    );
    if (anchorIndex == null) {
      for (int i = 0; i < points.length - 1; i++) {
        _drawSegmentWithWarning(
          canvas,
          points[i],
          points[i + 1],
          warning,
          solidPaint,
          dashedPaint,
        );
      }
      return;
    }

    for (int i = 0; i < anchorIndex; i++) {
      canvas.drawLine(
        _toScreen(points[i].x, points[i].y),
        _toScreen(points[i + 1].x, points[i + 1].y),
        solidPaint,
      );
    }

    final UgCurvePointData warningPoint = _CurveWarningPath.warningPoint(
      warningX: warning,
      maxY: constraintConfig.maxY,
    );
    canvas.drawLine(
      _toScreen(points[anchorIndex].x, points[anchorIndex].y),
      _toScreen(warningPoint.x, warningPoint.y),
      solidPaint,
    );

    final List<UgCurvePointData> rightPoints = <UgCurvePointData>[
      warningPoint,
      ...points.where((UgCurvePointData point) => point.x > warning),
    ];
    for (int i = 0; i < rightPoints.length - 1; i++) {
      _drawDashedLine(
        canvas,
        _toScreen(rightPoints[i].x, rightPoints[i].y),
        _toScreen(rightPoints[i + 1].x, rightPoints[i + 1].y),
        dashedPaint,
        dashWidth: 4.px,
        dashGap: 3.px,
      );
    }
  }

  void _drawSegmentWithWarning(
    Canvas canvas,
    UgCurvePointData start,
    UgCurvePointData end,
    double? warning,
    Paint solidPaint,
    Paint dashedPaint,
  ) {
    if (warning == null) {
      canvas.drawLine(
        _toScreen(start.x, start.y),
        _toScreen(end.x, end.y),
        solidPaint,
      );
      return;
    }

    final bool startLeft = start.x < warning;
    final bool endLeft = end.x < warning;
    if (startLeft && endLeft) {
      canvas.drawLine(
        _toScreen(start.x, start.y),
        _toScreen(end.x, end.y),
        solidPaint,
      );
      return;
    }
    if (!startLeft && !endLeft) {
      _drawDashedLine(
        canvas,
        _toScreen(start.x, start.y),
        _toScreen(end.x, end.y),
        dashedPaint,
        dashWidth: 4.px,
        dashGap: 3.px,
      );
      return;
    }

    final double dx = end.x - start.x;
    if (dx.abs() < 1e-9) {
      canvas.drawLine(
        _toScreen(start.x, start.y),
        _toScreen(end.x, end.y),
        solidPaint,
      );
      return;
    }

    final double t = (warning - start.x) / dx;
    final double warningY = start.y + t * (end.y - start.y);
    final Offset warningPoint = _toScreen(warning, warningY);
    if (startLeft) {
      canvas.drawLine(_toScreen(start.x, start.y), warningPoint, solidPaint);
      _drawDashedLine(
        canvas,
        warningPoint,
        _toScreen(end.x, end.y),
        dashedPaint,
        dashWidth: 4.px,
        dashGap: 3.px,
      );
    } else {
      _drawDashedLine(
        canvas,
        _toScreen(start.x, start.y),
        warningPoint,
        dashedPaint,
        dashWidth: 4.px,
        dashGap: 3.px,
      );
      canvas.drawLine(warningPoint, _toScreen(end.x, end.y), solidPaint);
    }
  }

  void _drawControlPoints(Canvas canvas) {
    final Paint fillPaint = Paint()
      ..color = style.pointFillColor
      ..style = PaintingStyle.fill;
    final Paint strokePaint = Paint()
      ..color = style.pointStrokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5.px;
    for (int i = 0; i < points.length; i++) {
      final UgCurvePointData point = points[i];
      if (!_shouldDrawControlPoint(i)) {
        continue;
      }
      _drawControlPoint(canvas, point, fillPaint, strokePaint);
    }
  }

  bool _shouldDrawControlPoint(int index) {
    return _CurveControlPointVisibility.shouldDraw(
      points: points,
      index: index,
      draggingIndex: draggingIndex,
      isLocked: _isLocked,
    );
  }

  void _drawControlPoint(
    Canvas canvas,
    UgCurvePointData point,
    Paint fillPaint,
    Paint strokePaint,
  ) {
    final Offset position = _toScreen(point.x, point.y);
    canvas.drawCircle(position, 4.px, fillPaint);
    canvas.drawCircle(position, 4.px, strokePaint);
  }

  void _drawTooltip(Canvas canvas, Size size) {
    final int? index = draggingIndex;
    if (index == null || index >= points.length) {
      return;
    }
    final UgCurvePointData point = points[index];
    final Offset position = _toScreen(point.x, point.y);
    final TextPainter painter = TextPainter(
      text: TextSpan(
        text: tooltipBuilder(point),
        style: TextStyle(
          color: style.tooltipTextColor,
          fontSize: style.tooltipFontSize,
          height: 20 / 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width * 0.72);

    final EdgeInsets padding = EdgeInsets.fromLTRB(12.px, 4.px, 12.px, 4.px);
    final double width = painter.width + padding.horizontal;
    final double height = painter.height + padding.vertical;
    final double x = (position.dx - width / 2).clamp(
      4.px,
      size.width - metrics.yAxisColumnWidth - width - 4.px,
    );
    double y = position.dy - height - 10.px;
    if (y < 4.px) {
      y = position.dy + 10.px;
    }
    y = y.clamp(4.px, size.height - height - 4.px);

    final RRect body = RRect.fromRectAndRadius(
      Rect.fromLTWH(x, y, width, height),
      Radius.circular(8.px),
    );
    final Path path = Path()..addRRect(body);
    canvas.drawShadow(path, style.tooltipShadowColor, 10, false);
    canvas.drawRRect(body, Paint()..color = style.tooltipBackgroundColor);
    painter.paint(canvas, Offset(x + padding.left, y + padding.top));
  }

  @override
  bool shouldRepaint(covariant _CurveForegroundPainter oldDelegate) {
    if (oldDelegate.points.length != points.length) {
      return true;
    }
    for (int i = 0; i < points.length; i++) {
      if (oldDelegate.points[i] != points[i]) {
        return true;
      }
    }
    return oldDelegate.axisConfig != axisConfig ||
        oldDelegate.constraintConfig != constraintConfig ||
        oldDelegate.draggingIndex != draggingIndex ||
        oldDelegate.activeRange != activeRange ||
        oldDelegate.warningX != warningX ||
        oldDelegate.tooltipBuilder != tooltipBuilder ||
        oldDelegate.styleSignature != styleSignature ||
        oldDelegate.metrics != metrics;
  }
}

void _drawDashedLine(
  Canvas canvas,
  Offset start,
  Offset end,
  Paint paint, {
  double dashWidth = 3,
  double dashGap = 3,
}) {
  final double dx = end.dx - start.dx;
  final double dy = end.dy - start.dy;
  final double distance = math.sqrt(dx * dx + dy * dy);
  if (distance == 0) {
    return;
  }
  final double ux = dx / distance;
  final double uy = dy / distance;

  double drawn = 0;
  bool on = true;
  while (drawn < distance) {
    final double segment = on
        ? math.min(dashWidth, distance - drawn)
        : math.min(dashGap, distance - drawn);
    if (on) {
      canvas.drawLine(
        Offset(start.dx + ux * drawn, start.dy + uy * drawn),
        Offset(
          start.dx + ux * (drawn + segment),
          start.dy + uy * (drawn + segment),
        ),
        paint,
      );
    }
    drawn += segment;
    on = !on;
  }
}
