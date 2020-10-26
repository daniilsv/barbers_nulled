import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/unfocus_ext.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/red_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'viewmodel.dart';

class AuthCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCodeController>(
      init: AuthCodeController(),
      global: false,
      builder: (model) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 1,
          ),
          body: Column(
            children: [
              const Spacer(),
              const Text(
                "На Ваш номер телефона отправлено смс с кодом",
                style: BRStyle.black20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  inactiveColor: BRColors.white,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: BRColors.white,
                ),
                onChanged: model.onCodeChanged,
              ),
              const Spacer(),
              Obx(() {
                if (model.countdown.value == 0)
                  return FlatButton(
                    onPressed: model.resendCode,
                    child: Text(
                      'Отправить код еще раз',
                      style: BRStyle.black14.copyWith(
                        color: BRColors.barRed,
                      ),
                    ),
                  );
                else
                  return FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Отправить код еще раз (${model.countdown.value}с)',
                      style: BRStyle.black14.copyWith(
                        color: BRColors.barRed.withOpacity(.6),
                      ),
                    ),
                  );
              }),
              RedButton.big(
                text: 'ДАЛЕЕ',
                onTap: model.registration,
              ),
              const Spacer(flex: 4),
            ],
          ).paddingSymmetric(horizontal: 35).unfocusOnTap(),
        ).withBusyStack(model);
      },
    );
  }
}
