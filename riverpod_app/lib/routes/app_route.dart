import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/authentication/presentation/login/login_screen.dart';
import 'package:riverpod_app/features/authentication/presentation/profile/profile_screen.dart';
import 'package:riverpod_app/features/main/presentation/main/main_screen.dart';
import 'package:riverpod_app/features/main/presentation/not_found/not_found_screen.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/features/mall/presentation/product_details/product_details_screen.dart';
import 'package:riverpod_app/features/mall/presentation/product_list/product_list_screen.dart';
import 'package:riverpod_app/features/mall/presentation/shopping_cart/shopping_cart_screen.dart';
import 'package:riverpod_app/features/todo/presentation/add_todo/add_todo_screen.dart';
import 'package:riverpod_app/features/todo/presentation/todo_details/todo_details_screen.dart';
import 'package:riverpod_app/features/todo/presentation/todo_list/todo_list_screen.dart';

enum AppRoute {
  home,
  shoppingCart,
  todo,
  addTodo,
  todoDetails,
  me,
  product,
  productDetails,
  myShoppingCart,
  login,
  notFound,
}

List<RouteBase> get routes => _routes;

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final List<RouteBase> _routes = <RouteBase>[
  StatefulShellRoute.indexedStack(
    builder: (
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
    ) {
      return MainScreen(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            name: AppRoute.home.name,
            pageBuilder: (_, GoRouterState state) {
              return const _AppTransitionPage(child: ProductListScreen());
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: '/shopping-cart',
            name: AppRoute.shoppingCart.name,
            pageBuilder: (_, GoRouterState state) {
              return const _AppTransitionPage(child: ShoppingCartScreen());
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: '/todo',
            name: AppRoute.todo.name,
            pageBuilder: (_, GoRouterState state) {
              return const _AppTransitionPage(child: TodoListScreen());
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                name: AppRoute.addTodo.name,
                pageBuilder: (_, GoRouterState state) {
                  return const _AppTransitionPage(child: AddTodoScreen());
                },
              ),
              GoRoute(
                path: ':index',
                name: AppRoute.todoDetails.name,
                pageBuilder: (_, GoRouterState state) {
                  final int index =
                      int.parse((state.pathParameters['index'] ?? '0'));
                  return _AppTransitionPage(
                    child: TodoDetailsScreen(index: index),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      StatefulShellBranch(
        routes: <RouteBase>[
          GoRoute(
            path: '/me',
            name: AppRoute.me.name,
            pageBuilder: (_, GoRouterState state) {
              return const _AppTransitionPage(child: ProfileScreen());
            },
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: '/login',
    name: AppRoute.login.name,
    pageBuilder: (_, GoRouterState state) {
      String? then = state.uri.queryParameters['then'];
      if (then != null && then.isNotEmpty) {
        then = Uri.decodeComponent(then);
      }
      String? isPop = state.uri.queryParameters['isPop'];
      return _AppTransitionPage(
        child: LoginScreen(then: then, isPop: isPop),
      );
    },
  ),
  GoRoute(
    path: '/my-shopping-cart',
    name: AppRoute.myShoppingCart.name,
    pageBuilder: (_, GoRouterState state) {
      return const _AppTransitionPage(
        child: ShoppingCartScreen(),
      );
    },
  ),
  GoRoute(
    path: '/product',
    name: AppRoute.product.name,
    pageBuilder: (_, GoRouterState state) {
      return const _AppTransitionPage(child: ProductListScreen());
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'details',
        name: AppRoute.productDetails.name,
        pageBuilder: (_, GoRouterState state) {
          final ProductEntity product = state.extra! as ProductEntity;
          return _AppTransitionPage(
            child: ProductDetailsScreen(product: product),
          );
        },
      ),
    ],
  ),
  GoRoute(
    path: '/404',
    name: AppRoute.notFound.name,
    pageBuilder: (_, GoRouterState state) {
      return _AppTransitionPage(
        child: NotFoundScreen(uri: state.extra as String? ?? ''),
      );
    },
  ),
];

class _AppTransitionPage<T> extends MaterialPage<T> {
  const _AppTransitionPage({
    required super.child,
    super.maintainState = true,
    super.fullscreenDialog = false,
    super.allowSnapshotting = true,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });
}

class _FadeTransitionPage extends CustomTransitionPage<void> {
  _FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
                  child: child,
                ));
}
