import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

const String _avatar =
    'https://img2.baidu.com/it/u=2007778290,345946360&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1351';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String userId,
    required String username,
    @Default(_avatar) String avatar,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
