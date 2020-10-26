import 'dart:async';

import 'package:barbers/api/auth.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/services/user.dart';
import 'package:barbers/ui/general/auth/phone/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class AuthCodeController extends GetxController with GetBusyMixin {
  String phone;

  final _api = Get.find<AuthApi>();
  // final _user = locator<UserService>();

  String code;

  final countdown = 5.obs;
  Timer timer;

  @override
  void onInit() {
    final phoneController = Get.find<AuthPhoneController>();
    phone = phoneController.currentPrefix + phoneController.controller.text;
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
  }

  void startTimer() {
    countdown.value = 5;
    timer = Timer.periodic(1.seconds, (_timer) {
      countdown.value -= 1;
      if (countdown.value <= 0) {
        _timer.cancel();
      }
    });
  }

  Future<void> resendCode() async {
    startTimer();
    await sendCode();
  }

  Future<void> sendCode() async {
    final resp = await _api.send(phone);
    if (resp != null)
      Get.snackbar('Успешно', 'Код отправлен заново', backgroundColor: Colors.green, colorText: Colors.white);
  }

  void onCodeChanged(String code) {
    this.code = code;
    update();
  }

  Future<void> registration() async {
    if (code?.length != 4) {
      Get.rawSnackbar(message: 'Введите код из смс', backgroundColor: BRColors.barRed);
      return;
    }
    setBusy(true);
    try {
      final response = await _api.confirm(phone, code);
      Get.find<UserService>().setUser(response);
    } finally {
      setBusy(false);
    }
  }
}
