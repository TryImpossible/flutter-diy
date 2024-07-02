import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/authentication/data/user_repository.dart';
import 'package:riverpod_app/features/authentication/domain/user_entity.dart';

part 'auth_repository.g.dart';

enum AuthState {
  /// 已认证
  authenticated,

  /// 未认证
  unauthorized,
}

class AuthRepository {
  AuthRepository(UserRepository userRepository)
      : _userRepository = userRepository,
        _authStateController = StreamController<AuthState>.broadcast() {
    _authStateController.stream.listen(
      (AuthState state) => _authState = state,
    );
  }

  final UserRepository _userRepository;

  Stream<AuthState> get onAuthStateChanged => _authStateController.stream;
  final StreamController<AuthState> _authStateController;

  bool get isLoggedIn => _authState == AuthState.authenticated;
  AuthState _authState = AuthState.unauthorized;

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (username.isEmpty || password.isEmpty) {
      throw Exception('username or password is empty');
    }
    _authStateController.add(AuthState.authenticated);
    final String userId = Random().nextInt(10000000).toString();
    _userRepository.currentUser =
        UserEntity(userId: userId, username: username);
    return true;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _authStateController.add(AuthState.unauthorized);
    _userRepository.currentUser = null;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.read(userRepositoryProvider.notifier));
}
