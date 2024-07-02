import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/authentication/data/auth_repository.dart';
import 'package:riverpod_app/routes/app_link.dart';

part 'login_logic.g.dart';

@riverpod
class LoginLogic extends _$LoginLogic {
  LoginLogic() : _usernameEditingController = TextEditingController();

  TextEditingController get usernameEditingController =>
      _usernameEditingController;

  final TextEditingController _usernameEditingController;

  String _password = '';

  set password(String value) => _password = value;

  String? _then;
  String? _isPop;

  @override
  FutureOr<bool> build({String? then, String? isPop}) async {
    _then = then;
    _isPop = isPop;
    return false;
  }

  void login() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref.read(authRepositoryProvider).login(
            username: _usernameEditingController.text,
            password: _password,
          );
    });
    if (state.value == true) {
      if (_then != null && _then!.isNotEmpty) {
        ref.read(appLinkProvider).go(_then!);
      } else if (_isPop == '1') {
        Future.delayed(kThemeChangeDuration, ref.read(appLinkProvider).pop);
      } else {
        ref.read(appLinkProvider).toHome();
      }
    } else if (state.hasError) {
      EasyLoading.showError(state.error.toString());
    }
  }
}
