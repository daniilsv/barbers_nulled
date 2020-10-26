import 'dart:collection';

import 'package:get/get.dart';

class UserRootViewModel extends GetxController {
  final selectedPageIndex = 0.obs;

  final Queue<int> _tabsStack = Queue();

  Future<bool> onWillPop() async {
    bool isFirstRouteInCurrentTab = true;
    isFirstRouteInCurrentTab = !await Get.nestedKey(selectedPageIndex.value).currentState.maybePop();

    if (isFirstRouteInCurrentTab) {
      if (_tabsStack.length > 1) {
        _tabsStack.removeFirst();
        selectedPageIndex.value = _tabsStack.first;
      } else if (selectedPageIndex.value != 0 && _tabsStack.length == 1) {
        selectedPageIndex.value = 0;
        _tabsStack.clear();
      } else {
        return true;
      }
      return !isFirstRouteInCurrentTab;
    }
    return isFirstRouteInCurrentTab;
  }

  void onTap(int index) {
    if (_tabsStack.contains(index)) {
      _tabsStack.remove(index);
    }
    _tabsStack.addFirst(index);

    if (index == selectedPageIndex.value) {
      if (Get.nestedKey(selectedPageIndex.value).currentState.canPop()) {
        Get.nestedKey(selectedPageIndex.value).currentState.popUntil((route) => route.isFirst);
      } else {
        if (selectedPageIndex.value == 0) {
          // Можно реализовать прокрутку вверх по повторному клику на вкладку
        }
      }
    }
    selectedPageIndex.value = index;
  }
}
