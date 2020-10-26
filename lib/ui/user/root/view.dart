import 'package:barbers/res/res.dart';
import 'package:barbers/ui/general/settings/view.dart';
import 'package:barbers/ui/user/favorites/view.dart';
import 'package:barbers/ui/user/main/view.dart';
import 'package:barbers/ui/user/orders/view.dart';
import 'package:barbers/ui/user/profile/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view_model.dart';

enum UserRootTab { main, favorites, orders, profile, settings }

class UserRootView extends StatelessWidget {
  UserRootView() : model = UserRootViewModel();
  final UserRootViewModel model;
  final Map<UserRootTab, List<dynamic>> _tabs = {
    UserRootTab.main: [
      'Главная',
      'main',
      UserMainPageView(),
    ],
    UserRootTab.favorites: [
      'Избранное',
      'favorites',
      UserFavoritesPageView(),
    ],
    UserRootTab.orders: [
      'Мои записи',
      'orders',
      UserOrdersPageView(),
    ],
    UserRootTab.profile: [
      'Профиль',
      'profile',
      UserProfilePageView(),
    ],
    UserRootTab.settings: [
      'Настройки',
      'settings',
      SettingsPageView(),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return GetX<UserRootViewModel>(
      init: model,
      builder: (model) {
        return WillPopScope(
          onWillPop: model.onWillPop,
          child: Scaffold(
            body: IndexedStack(
              index: model.selectedPageIndex.value,
              children: <Widget>[
                for (final tab in UserRootTab.values)
                  Navigator(
                    key: Get.nestedKey(tab.index),
                    observers: [HeroController()],
                    onGenerateRoute: (settings) => GetPageRoute<dynamic>(
                      settings: settings,
                      page: () => _tabs[tab][2] as Widget,
                    ),
                  ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                for (final tab in UserRootTab.values)
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/${_tabs[tab][1]}.png',
                      width: 16,
                      height: 16,
                    ).paddingOnly(bottom: 4),
                    activeIcon: Image.asset(
                      'assets/icons/${_tabs[tab][1]}_active.png',
                      width: 16,
                      height: 16,
                    ).paddingOnly(bottom: 4),
                    label: _tabs[tab][0],
                  ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: model.selectedPageIndex.value,
              onTap: model.onTap,
              selectedItemColor: BRColors.barRed,
              unselectedFontSize: 10,
              selectedFontSize: 10,
            ),
          ),
        );
      },
    );
  }
}
