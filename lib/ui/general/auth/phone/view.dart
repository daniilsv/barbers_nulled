import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/unfocus_ext.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/phone_number_input.dart';
import 'package:barbers/widgets/red_button.dart';
import 'package:barbers/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'viewmodel.dart';

class AuthPhoneView extends StatelessWidget {
  final AuthPhoneController c = Get.put(AuthPhoneController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthPhoneController>(
      init: c,
      builder: (model) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Вход', style: BRStyle.black20),
                const SizedBox(height: 21),
                const Text(
                  'Введите номер вашего телефона и мы отправим код для его подтверждения',
                  style: BRStyle.text14,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                PhoneNumberInput(
                  controller: model.controller,
                  maskFormatter: model.maskFormatter,
                  focusNode: model.phoneFocus,
                  currentPrefix: model.currentPrefix,
                  prefixes: model.prefixes,
                  onChangePrefix: model.onChangePrefix,
                  onChange: model.onChangeNumber,
                ),
                const SizedBox(height: 53),
                RedButton.big(text: 'ВХОД', onTap: model.sendCode),
                const SizedBox(height: 53),
                UnderlinedButton(
                  text: "Политика конфиденциальности",
                  onTap: model.privacyPolicy,
                ),
                const SizedBox(height: 24),
                UnderlinedButton(
                  text: "Правила сервиса",
                  onTap: model.serviceRules,
                ),
              ],
            ).paddingSymmetric(vertical: 90, horizontal: 35),
          ).unfocusOnTap(),
        ).withBusyStack(c);
      },
    );
  }
}
