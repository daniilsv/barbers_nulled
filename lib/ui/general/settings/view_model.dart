
import 'package:barbers/api/feedback.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsViewModel extends GetxController with GetBusyMixin {
  final _api = Get.find<FeedbackApi>();

  final TextEditingController themeController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  Future<void> send(String theme, String text) async {
    setBusy(true);
    try {
      await _api.send(theme: themeController.text, text: textController.text);
      Get.snackbar('Успешно', 'Ваше обращение отправлено', backgroundColor: Colors.green, colorText: Colors.white);
      textController.text = '';
      themeController.text = '';
    } finally {
      setBusy(false);
    }
  }

  void onSend() {
    if (themeController.text.isEmpty || textController.text.isEmpty) {
      Get.defaultDialog(title: 'Ошибка', middleText: 'Не все поля заполнены', radius: 6);
      return;
    }
    Get.back();
    send(themeController.text, textController.text);
  }
}
