import 'package:barbers/res/res.dart';
import 'package:barbers/ui/general/help/view.dart';
import 'package:flutter/material.dart';
import 'package:barbers/widgets/background.dart';
import 'package:get/get.dart';

import 'view_model.dart';
import 'widgets/card.dart';
import 'widgets/support.dart';

class SettingsPageView extends StatelessWidget {
  final SettingsViewModel c = Get.put(SettingsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Настройки и приватность', style: BRStyle.black14),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsCard(
              title: 'Написать в поддержку',
              image: 'assets/icons/message.png',
              onTap: () => Get.bottomSheet(
                const SupportBottomSheet(),
                isScrollControlled: true,
              ),
            ),
            SettingsCard(
              title: 'Помощь',
              image: 'assets/icons/support.png',
              onTap: () => Get.to(HelpView()),
            ),
          ],
        ),
      ).withBackground(),
    );
  }
}
