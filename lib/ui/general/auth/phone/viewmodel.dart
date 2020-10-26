import 'package:barbers/api/auth.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/utils.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/ui/general/auth/code/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthPhoneController extends GetxController with GetBusyMixin {
  final _api = Get.find<AuthApi>();

  final int phoneLength = 10;

  TextEditingController controller = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  String currentPrefix = '+7';
  List<String> prefixes = ['+7', '+380', '+114'];

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '(###) ###-##-##');

  void onChangePrefix(String prefix) {
    currentPrefix = prefix;
    update();
  }

  void onChangeNumber(String phone) {
    if (maskFormatter.getUnmaskedText().length == phoneLength) {
      phoneFocus.unfocus();
    }
    update();
  }

  Future<void> sendCode() async {
    setBusy(true);
    await 2.delay();
    setBusy(false);
    if (maskFormatter?.getUnmaskedText()?.length != phoneLength) {
      Get.rawSnackbar(message: 'Введите номер телефона', backgroundColor: BRColors.barRed);
      return;
    }
    setBusy(true);
    await _api.send(currentPrefix + controller?.text);
    setBusy(false);
    Get.to(AuthCodeView());
  }

  void privacyPolicy() {
    Utils.launchUrl('https://static.itis.team/privacy_policy.html');
  }

  void serviceRules() {
    Utils.launchUrl('https://static.itis.team/privacy_policy.html');
  }
}
