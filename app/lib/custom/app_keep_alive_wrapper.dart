import 'package:flutter/material.dart';

class AppKeepAliveWrapper extends StatefulWidget {
  const AppKeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _AppKeepAliveWrapperState createState() => _AppKeepAliveWrapperState();
}

class _AppKeepAliveWrapperState extends State<AppKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant AppKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
