import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/authentication/data/user_repository.dart';
import 'package:riverpod_app/features/authentication/domain/user_entity.dart';
import 'package:riverpod_app/features/authentication/presentation/profile/profile_logic.dart';
import 'package:riverpod_app/widgets/app_nav_bar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 须加上这行产生依赖关系，否则profileLogicProvider会自动销毁
    ref.watch(profileLogicProvider);
    final UserEntity? user = ref.watch(userRepositoryProvider);
    return Scaffold(
      appBar: const AppNavBar(titleText: '我'),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(user?.avatar ?? '', width: 88, height: 88),
              Text(user?.username ?? '', style: const TextStyle(fontSize: 24)),
            ],
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: ref.read(profileLogicProvider.notifier).editProfile,
            child: const Text('更新用户名称'),
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: ref.read(profileLogicProvider.notifier).toShoppingCart,
            child: const Text('我的购物车'),
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: ref.read(profileLogicProvider.notifier).logout,
            child: const Text('退出登录'),
          ),
        ],
      ),
    );
  }
}
