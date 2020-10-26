import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';
import 'package:barbers/app/unfocus_ext.dart';
import 'package:get/get.dart';

import '../view_model.dart';

class SupportBottomSheet extends StatelessWidget {
  const SupportBottomSheet();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsViewModel>();

    return DraggableScrollableSheet(
      maxChildSize: 0.6,
      expand: false,
      builder: (c, con) {
        return SingleChildScrollView(
          controller: con,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Написать в поддержку', style: BRStyle.black18),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller.themeController,
                      decoration: const InputDecoration(
                        hintText: 'Тема',
                        hintStyle: BRStyle.text14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller.textController,
                      decoration: const InputDecoration(
                        hintText: 'Текст сообщения',
                        hintStyle: BRStyle.text14,
                      ),
                      maxLines: 4,
                      minLines: 4,
                      textInputAction: TextInputAction.newline,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: controller.onSend,
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Отправить', style: BRStyle.red14),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 24).unfocusOnTap(),
        );
      },
    );
  }
}
