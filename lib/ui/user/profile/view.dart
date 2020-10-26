import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/unfocus_ext.dart';
import 'package:barbers/datamodels/city.dart';
import 'package:barbers/datamodels/country.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/ui/user/root/view_model.dart';
import 'package:barbers/widgets/avatar_image.dart';
import 'package:barbers/widgets/custom_dropdown.dart';
import 'package:barbers/widgets/red_button.dart';
import 'package:barbers/widgets/text_button.dart';
import 'package:barbers/widgets/titled_birthday_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'viewmodel.dart';
import 'widgets/blocks.dart';

class UserProfilePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      builder: (model) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text("Профиль", style: BRStyle.black14),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(model.user.name),
                  subtitle: Text(model.user.phone),
                  leading: AvatarImage(
                    file: model.photoFile,
                    url: model.user.photo,
                    size: 80,
                    isEditable: true,
                    onChange: model.onPhotoChange,
                  ),
                ),
                const SizedBox(height: 12),
                if (model.country != null)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Страна'),
                    subtitle: CustomDropDown<CountryModel>(
                      itemBuilder: (context, dynamic item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(item.name, style: BRStyle.black16),
                      ),
                      items: model.countries,
                      value: model.country,
                      valueText: model.country.name,
                      containerHint: 'Страна',
                      itemHeight: 45,
                      onChoose: (dynamic d) {
                        model.setCountry(d);
                      },
                      containerDecoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: BRColors.divider)),
                      ),
                    ),
                  ),
                const SizedBox(height: 12),
                if (model.city != null)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text('Город'),
                    subtitle: CustomDropDown<CityModel>(
                      itemBuilder: (context, dynamic item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(item.name, style: BRStyle.black16),
                      ),
                      items: model.cities,
                      value: model.city,
                      valueText: model.city.name,
                      containerHint: 'Город',
                      itemHeight: 45,
                      onChoose: (dynamic d) {
                        model.setCity(d);
                      },
                      containerDecoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: BRColors.divider)),
                      ),
                    ),
                  ),
                const SizedBox(height: 34),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: const Text('Дата рождения'),
                  subtitle: TitledBirthdayDatePicker(
                    onDateChanged: model.setDate,
                    title: model.birthDay,
                  ),
                ),
                const SizedBox(height: 34),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: const Text('Как часто вы стрижетесь?'),
                  subtitle: CustomDropDown<String>(
                    itemBuilder: (context, dynamic item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: BRStyle.black16),
                    ),
                    items: const [
                      "Очень часто",
                      "Часто",
                      "Редко",
                    ],
                    value: model.frequency,
                    valueText: model.frequency,
                    containerHint: 'Как часто вы стрижетесь?',
                    itemHeight: 45,
                    onChoose: (dynamic d) {
                      model.setFrequency(d);
                    },
                    containerDecoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: BRColors.divider)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RedButton(
                      text: 'Сохранить изменения'.toUpperCase(),
                      onTap: model.save,
                      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 70),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                UnderlinedButton(
                  text: 'Перейти в мои записи',
                  textStyle: BRStyle.red16,
                  onTap: () => Get.find<UserRootViewModel>().onTap(2),
                ),
                const SizedBox(height: 24),
                ProfileBlocks(
                  isBarber: model.barber != null,
                  firstOnTap: model.onFirstBlockTap,
                  secondOnTap: model.exit,
                ),
                const SizedBox(height: 62),
                UnderlinedButton(
                  text: "Удалить аккаунт",
                  lineColor: BRColors.lightGrey,
                  textStyle: BRStyle.text14,
                  onTap: model.deleteAccount,
                ),
                const SizedBox(height: 40),
              ],
            ).paddingSymmetric(horizontal: 24),
          ).unfocusOnTap(),
        ).withBusyStack(model);
      },
    );
  }
}
