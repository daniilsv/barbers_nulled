import 'package:barbers/api/favorites.dart';
import 'package:barbers/app/connectivity.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'user.dart';

class FavoritesService extends GetxService with ConnectivityMixin {
  final _barbers = ReadWriteValue<List<dynamic>>('favorites', []);

  final _api = Get.find<FavoritesApi>();

  final barbers = <BarberModel>[].obs;

  @override
  Future<void> onInit() async {
    await Get.find<UserService>().completer.future;
    barbers.clear();
    barbers.addAll(_barbers.val.map((b) => BarberModel.fromJson(b)));
    onConnection(fetch, 'getFavorites');
  }

  void save() {
    _barbers.val = barbers.map((b) => b.toJson()).toList();
  }

  Future<void> fetch() async {
    final t = await _api.getAll();
    barbers.clear();
    barbers.addAll(t);
    save();
  }

  Future<void> add(BarberModel barber) async {
    await _api.add(barber.id);
    if (barbers.firstWhere((b) => b.id == barber.id, orElse: () => null) == null) return;
    barbers.add(barber);
    save();
  }

  Future<void> remove(String barberId) async {
    await _api.remove(barberId);
    barbers.removeWhere((b) => b.id == barberId);
    save();
  }
}
