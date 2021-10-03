import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Stack;
import 'package:strive_benefits/ui/bottom_bar_pages.dart';
import 'package:strive_benefits/utils/app_constant.dart';
import 'package:strive_benefits/utils/stack.dart';

class Screens with ChangeNotifier {
  final Stack<Widget> stack = Stack();

  int currentIndex = 0;
  Widget currentScreen = const BottomBarPages(
    title: AppConstant.home,
  );

  void init() {
    stack.push(const BottomBarPages(
      title: AppConstant.home,
    ));

    stack.push(const BottomBarPages(
      title: AppConstant.feed,
    ));

    stack.push(const BottomBarPages(
      title: AppConstant.settings,
    ));

    stack.push(const BottomBarPages(
      title: AppConstant.profile,
    ));
  }

  void updateIndex(int index) {
    currentIndex = index;
    getCurrentScreen(index: index);
  }

  void getCurrentScreen({int? index}) {
    if (index != null && stack.isNotEmpty) {
      currentScreen = stack.getItem(index);
    } else {
      currentScreen = stack.top();
    }
    notifyListeners();
  }

  void push(Widget widget) {
    stack.push(widget);
    getCurrentScreen();
  }

  void pop() {
    stack.pop();
    if (stack.size() == AppConstant.bottomNavigationBarSize) {
      getCurrentScreen(index: currentIndex);
    } else {
      getCurrentScreen();
    }
  }
}
