import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/authentication/data/auth_repository.dart';
import 'package:riverpod_app/features/main/presentation/not_found/not_found_screen.dart';
import 'package:riverpod_app/routes/app_nav_observer.dart';

import 'app_route.dart';

part 'app_router.g.dart';

class _AppRouterRefreshStream extends ChangeNotifier {
  _AppRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  AppRouter(AuthRepository authRepository) {
    _router = GoRouter(
      initialLocation: '/home',
      routes: routes,
      refreshListenable:
          _AppRouterRefreshStream(authRepository.onAuthStateChanged),
      redirect: (BuildContext context, GoRouterState state) {
        return _guard(context, state, authRepository);
      },
      onException: (
        BuildContext context,
        GoRouterState state,
        GoRouter router,
      ) {
        router.go('/404', extra: state.uri.toString());
      },
      observers: <NavigatorObserver>[AppNavObserver()],
    );
  }

  GoRouter get routerConfig => _router;
  late final GoRouter _router;

  final List<String> _routeBlacklist = <String>[
    '/shopping-cart',
    '/me',
    '/my-shopping-cart'
  ];

  String? _guard(
    BuildContext context,
    GoRouterState state,
    AuthRepository authRepository,
  ) {
    final String location = state.matchedLocation;
    print('location: $location');
    if (!_routeBlacklist.contains(location)) {
      // 不进行重定向
      return null;
    }

    final bool isLoggedIn = authRepository.isLoggedIn;
    final bool isLoggingIn = location == '/login';

    // 当前用户没有登录且不在登录页面，则跳转至登录页面
    if (!isLoggedIn && !isLoggingIn) {
      return '/login?then=${Uri.encodeComponent(location)}';
    }
    // 当前用户已登录且在登录页面，则跳转至主页
    else if (isLoggedIn && isLoggingIn) {
      return '/home';
    }

    // 不进行重定向
    return null;
  }

  void go(String location, {Object? extra}) {
    _router.go(location, extra: extra);
  }

  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    _router.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future<T?> push<T extends Object?>(
    String location, {
    Object? extra,
  }) {
    return _router.push<T>(location, extra: extra);
  }

  Future<T?> pushNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return push<T>(
      _router.namedLocation(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      ),
      extra: extra,
    );
  }

  Future<T?> pushReplacement<T extends Object?>(
    String location, {
    Object? extra,
  }) {
    return _router.pushReplacement<T>(location, extra: extra);
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return pushReplacement<T>(
      _router.namedLocation(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      ),
      extra: extra,
    );
  }

  Future<T?> replace<T>(String location, {Object? extra}) {
    return _router.replace<T>(location, extra: extra);
  }

  Future<T?> replaceNamed<T>(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return replace(
      _router.namedLocation(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      ),
      extra: extra,
    );
  }

  void pop<T extends Object?>([T? result]) {
    _router.pop<T>(result);
  }

  void refresh() {
    _router.refresh();
  }
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  return AppRouter(authRepository);
}
