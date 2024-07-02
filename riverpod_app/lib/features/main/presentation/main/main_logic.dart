import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_logic.g.dart';

@riverpod
class MainLogic extends _$MainLogic {
  final PageController pageController = PageController(initialPage: 0);

  @override
  int build() => pageController.initialPage;

  void onTap(int index) {
    state = index;
    pageController.jumpToPage(index);
  }
}
