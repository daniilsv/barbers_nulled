import 'package:barbers/app/connectivity.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/services/favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFavoritesPageViewModel extends GetxController with GetBusyMixin, ConnectivityMixin {
  final _service = Get.find<FavoritesService>();

  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    _service.barbers.listen((_) => update());
    barbers = _barbers;
  }

  List<BarberModel> get _barbers => _service.barbers;
  List<BarberModel> barbers = [];

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
    await _service.fetch();
    barbers = _barbers;
    setBusy(false);
  }

  void onRemove(BarberModel barber) {
    _service.remove(barber.id);
  }
}
