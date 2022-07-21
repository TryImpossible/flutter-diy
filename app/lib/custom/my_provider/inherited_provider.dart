import 'package:flutter/material.dart';

/// 一个能用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    /// 在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`
    return true;
  }
}
