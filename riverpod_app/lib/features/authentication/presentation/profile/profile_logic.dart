import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/authentication/data/auth_repository.dart';
import 'package:riverpod_app/features/authentication/data/user_repository.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'profile_logic.g.dart';

@riverpod
class ProfileLogic extends _$ProfileLogic {
  @override
  FutureOr<void> build() async {}

  Future<void> editProfile() async {
    ref.read(userRepositoryProvider.notifier).editProfile();
  }

  Future<void> toShoppingCart() async {
    ref.read(appLinkProvider).toMyShoppingCart();
  }

  Future<void> logout() async {
    EasyLoading.show();
    state = await AsyncValue.guard(ref.read(authRepositoryProvider).logout);
    EasyLoading.dismiss();
  }
}
