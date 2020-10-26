import 'dart:async';
import 'dart:io';

import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/city.dart';
import 'package:barbers/datamodels/country.dart';
import 'package:barbers/datamodels/user.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/services/static.dart';
import 'package:barbers/services/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserProfileController extends GetxController with GetBusyMixin {
  // final _api = Get.find<AuthApi>();
  // final _mediaApi = Get.find<MediaApi>();

  final _userService = Get.find<UserService>();
  final _staticService = Get.find<StaticService>();

  UserModel _user;
  UserModel get user => _user;

  BarberModel get barber => _userService.barber;

  File photoFile;

  CountryModel country;
  CityModel city;
  DateTime date;
  String frequency;

  List<CountryModel> get countries => _staticService.countries;
  List<CityModel> get cities => country == null ? [] : _staticService.cities[country.id];

  @override
  void onInit() {
    _user = _userService.user;
    date = _user.birthday;
    frequency = _user.frequency;
    loadCity();
    _staticService.updater.listen((_) {
      if (country == null) loadCity();
      update();
    });
  }

  void loadCity() {
    try {
      country = countries.firstWhere((element) => element.id == _user.countryId);
      _staticService.getCities(country.id).then((_) {
        city = cities.firstWhere((element) => element.id == _user.cityId);
      });
    } finally {}
  }

  void save() {}

  void onPhotoChange(File file) {
    photoFile = file;
    update();
  }

  String get birthDay => DateFormat('dd.MM.yyyy').format(date);

  Future<void> setCountry(CountryModel country) async {
    this.country = country;
    await _staticService.getCities(country.id);
    city = cities.first;
    update();
  }

  void setCity(CityModel city) {
    this.city = city;
    update();
  }

  void setDate(DateTime date) {
    this.date = date;
    update();
  }

  void setFrequency(String frequency) {
    this.frequency = frequency;
    update();
  }

  Future<void> exit() async {
    final res = await Get.defaultDialog(
      title: 'Выход',
      content: const Text('Вы действительно хотите выйти?'),
      cancel: TextButton(onPressed: Get.back, child:const  Text('Отмена', style: BRStyle.red14)),
      confirm: TextButton(onPressed: () => Get.back(result: true), child:const  Text('Выход', style: BRStyle.text14)),
    );
    if (res != true) return;
    _userService.logout();
  }

  void deleteAccount() {
    // Get.to<void>(DeleteUserView());
  }

  void onFirstBlockTap() {
    // if (barber == null)
    //   Get.to(BarbersRegistration());
    // else
    //   _userService.switchToBarber();
  }
}
