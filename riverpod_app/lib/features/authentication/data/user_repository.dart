import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/features/authentication/domain/user_entity.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
class UserRepository extends _$UserRepository {
  UserEntity? get currentUser => state;

  set currentUser(UserEntity? user) => state = user;

  @override
  UserEntity? build() {
    return null;
  }

  Future<bool> editProfile() async {
    if (state == null) {
      return false;
    }
    await Future.delayed(const Duration(milliseconds: 200));
    state = state?.copyWith(username: '名称${Random().nextInt(10)}');
    return true;
  }
}
