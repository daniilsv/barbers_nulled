import 'package:barbers/app/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/connectivity.dart';
import 'generated/l10n.dart';
import 'res/res.dart';
import 'services/favorites.dart';
import 'services/static.dart';
import 'services/user.dart';
import 'ui/general/splash/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.config(
    defaultPopGesture: true,
    enableLog: true,
    defaultOpaqueRoute: true,
    defaultTransition: Transition.cupertino,
  );
  await GetStorage.init();
  initServices();
  runApp(App());
}

void initServices() {
  AppApi.init();
  Get.put(ConnectivityService());
  Get.put(UserService());
  Get.put(StaticService());
  Get.put(FavoritesService());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'barbers',
      home: SplashView(),
      popGesture: true,
      enableLog: true,
      onInit: () {
        Get.find<UserService>().init();
      },
      theme: ThemeData(
        platform: TargetPlatform.android,
        brightness: Brightness.light,
        accentColor: BRColors.barRed,
      ),
      supportedLocales: Strings.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        Strings.delegate,
      ],
      builder: (ctx, child) {
        return MediaQuery(
          data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
    );
  }
}
