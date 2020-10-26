import 'package:barbers/api/barber.dart';
import 'package:barbers/api/call.dart';
import 'package:barbers/app/connectivity.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/utils.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/barbers_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMainPageViewModel extends GetxController with GetBusyMixin, ConnectivityMixin {
  final _callApi = Get.find<CallApi>();
  final _barbersApi = Get.find<BarberApi>();

  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    if (_barbers.isEmpty) {
      refresh();
    } else {
      barbers = _barbers;
    }
  }

  BarbersFilterDto filter = BarbersFilterDto();

  List<BarberModel> _barbers = [];
  List<BarberModel> barbers = [];

  bool get isFiltered =>
      filter.cityId != null || filter.countryId != null || filter.orderPlace != null || filter.serviceId != null;

  void call(BarberModel barber) {
    onConnection(() {
      _callApi.barber(barber.id);
    });
    Utils.launchUrl('tel:${barber.user?.phone}');
  }

  void search(String search) {
    if (search?.isEmpty ?? '') {
      barbers = _barbers;
      update();
      return;
    }
    search = search.toLowerCase().replaceAll('ё', 'е');
    barbers = _barbers
        .where((element) => (element.user?.name ?? 'Нет имени').toLowerCase().replaceAll('ё', 'е').contains(search))
        .toList();
    update();
  }

  Future<void> refresh() async {
    setBusy(true);
    Get.focusScope.unfocus();
    searchController.text = '';
    _barbers = await _barbersApi.filter(filter);
    barbers = _barbers;
    setBusy(false);
    update();
  }
}
