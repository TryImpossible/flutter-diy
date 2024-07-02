import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/mall/domain/product_entity.dart';
import 'package:riverpod_app/routes/app_route.dart';
import 'package:riverpod_app/routes/app_router.dart';

part 'app_link.g.dart';

class AppLink {
  AppLink(AppRouter appRouter) : _appRouter = appRouter;
  final AppRouter _appRouter;

  void go(String location, {Object? extra}) {
    _appRouter.go(location, extra: extra);
  }

  void pop<T>([T? result]) {
    _appRouter.pop<T>();
  }

  void toHome() {
    _appRouter.goNamed(AppRoute.home.name);
  }

  void toShoppingCart() {
    _appRouter.goNamed(AppRoute.shoppingCart.name);
  }

  void toTodo() {
    _appRouter.goNamed(AppRoute.todo.name);
  }

  void toAddTodo() {
    _appRouter.pushNamed(AppRoute.addTodo.name);
  }

  void toTodoDetails(int index) {
    _appRouter.pushNamed(
      AppRoute.todoDetails.name,
      pathParameters: <String, String>{'index': index.toString()},
    );
  }

  void toMyShoppingCart() {
    _appRouter.pushNamed(AppRoute.myShoppingCart.name);
  }

  void toProductDetails(ProductEntity product) {
    _appRouter.pushNamed(AppRoute.productDetails.name, extra: product);
  }

  void toLogin({bool? isPop}) {
    _appRouter.pushNamed(
      AppRoute.login.name,
      queryParameters: <String, String>{
        if (isPop == true) 'isPop': '1',
      },
    );
  }
}

@riverpod
AppLink appLink(AppLinkRef ref) {
  return AppLink(ref.read(appRouterProvider));
}
