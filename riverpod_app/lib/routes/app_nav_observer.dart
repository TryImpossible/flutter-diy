import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

extension on Route<dynamic> {
  String get details => 'route(${settings.name}: ${settings.arguments})';
}

/// The Navigator observer.
class AppNavObserver extends NavigatorObserver {
  /// Creates a [AppNavObserver].
  AppNavObserver() {
    log.onRecord.listen((LogRecord e) => debugPrint('$e'));
  }

  /// The logged message.
  final Logger log = Logger('MyNavObserver');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      log.info('didPush: ${route.details}, previousRoute= ${previousRoute?.details}');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      log.info('didPop: ${route.details}, previousRoute= ${previousRoute?.details}');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      log.info('didRemove: ${route.details}, previousRoute= ${previousRoute?.details}');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      log.info('didReplace: new= ${newRoute?.details}, old= ${oldRoute?.details}');

  @override
  void didStartUserGesture(
      Route<dynamic> route,
      Route<dynamic>? previousRoute,
      ) =>
      log.info('didStartUserGesture: ${route.details}, '
          'previousRoute= ${previousRoute?.details}');

  @override
  void didStopUserGesture() => log.info('didStopUserGesture');
}