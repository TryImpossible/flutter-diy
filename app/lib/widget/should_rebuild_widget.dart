
import 'package:flutter/material.dart';

typedef ShouldRebuild = bool Function(Widget widget);

class ShouldRebuildWidget<T extends Widget> extends StatefulWidget {
  ShouldRebuildWidget({
    Key? key,
    required this.provider,
    this.shouldRebuild,
  });

  final ValueGetter<T> provider;
  final ShouldRebuild? shouldRebuild;

  @override
  _ShouldRebuildState createState() => _ShouldRebuildState<T>();
}

class _ShouldRebuildState<T extends Widget>
    extends State<ShouldRebuildWidget<T>> {
  late ValueGetter<T> _provider;

  T? _oldWidget;

  @override
  void initState() {
    super.initState();
    _provider = widget.provider;
  }

  @override
  Widget build(BuildContext context) {
    if (this._oldWidget == null) {
      this._oldWidget = _provider();
    }
    if ((widget.shouldRebuild == null
        ? true
        : widget.shouldRebuild!(_oldWidget!))) {
      this._oldWidget = _provider();
    }
    return _oldWidget!;
  }
}
