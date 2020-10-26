import 'dart:async';

import 'package:barbers/api/barber.dart';
import 'package:barbers/api/users.dart';
import 'package:barbers/app/connectivity.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/user.dart';
import 'package:barbers/datamodels/user_token.dart';
import 'package:barbers/main.dart';
import 'package:barbers/ui/general/auth/phone/view.dart';
import 'package:barbers/ui/general/splash/view.dart';
import 'package:barbers/ui/user/root/view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserService extends GetxService with ConnectivityMixin {
  String get accessToken => _accessToken.val;
  UserModel user;
  BarberModel barber;
  final _accessToken = ReadWriteValue<String>('accessToken', null);
  final _user = ReadWriteValue<Map<String, dynamic>>('user', null);
  final _barber = ReadWriteValue<Map<String, dynamic>>('barber', null);
  final _isBarberView = false.val('isBarberView');

  final _userApi = Get.find<UsersApi>();
  final _barberApi = Get.find<BarberApi>();

  Completer completer = Completer<void>();

  Future<void> init() async {
    await 1.delay();
    if (accessToken == null) {
      Get.offAll(AuthPhoneView());
      return;
    }
    if (!completer.isCompleted) completer.complete();
    user = UserModel.fromJson(_user.val);
    if (_barber.val != null) barber = BarberModel.fromJson(_barber.val);
    onConnection(() async {
      user = await _userApi.getInfo();
      _user.val = user?.toJson();
    }, 'getUser');
    onConnection(() async {
      barber = await _barberApi.my();
      _barber.val = barber?.toJson();
    }, 'getBarber');
    if (barber == null) _isBarberView.val = false;
    if (_isBarberView.val)
      Get.offAll(UserRootView()); //(BarberRootView());
    else
      Get.offAll(UserRootView());
  }

  void setUser(UserTokenResponse response) {
    _accessToken.val = response.token;
    _isBarberView.val = false;
    user = response.user;
    _user.val = user.toJson();
    if (!completer.isCompleted) completer.complete();
    onConnection(() async {
      barber = await _barberApi.my();
      _barber.val = barber.toJson();
    }, 'getBarber');
    Get.offAll(UserRootView());
  }

  Future<void> logout() async {
    await GetStorage().erase();
    user = barber = null;
    completer = Completer<void>();
    Get.reset();
    initServices();
    Get.offAll(SplashView());
  }
}
