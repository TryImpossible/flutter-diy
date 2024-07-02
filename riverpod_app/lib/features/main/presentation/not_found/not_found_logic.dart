import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'not_found_logic.g.dart';

@riverpod
class NotFoundLogic extends _$NotFoundLogic {
  @override
  void build() {}

  void toMain() {
    ref.read(appLinkProvider).toHome();
  }
}
