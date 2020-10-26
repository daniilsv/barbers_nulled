import 'package:auto_size_text/auto_size_text.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'viewmodel.dart';

class SplashView extends StatelessWidget {
  final c = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 150,
              height: 150,
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            const SizedBox(height: 20),
            const AutoSizeText(
              'barbers_msk',
              style: BRStyle.black48,
              minFontSize: 16,
            ),
            const Spacer(flex: 3),
            const Text('Идет загрузка', style: BRStyle.black14),
            const SizedBox(height: 12),
            SizedBox(
              width: Get.width * .5,
              height: 2,
              child: Obx(
                () => LinearProgressIndicator(
                  value: c.progress.value,
                  backgroundColor: BRColors.progress.withOpacity(.2),
                  valueColor: const AlwaysStoppedAnimation(BRColors.progress),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ).withBackground(),
    );
  }
}
