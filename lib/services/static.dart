import 'package:barbers/api/static.dart';
import 'package:barbers/app/connectivity.dart';
import 'package:barbers/datamodels/city.dart';
import 'package:barbers/datamodels/country.dart';
import 'package:barbers/datamodels/service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'user.dart';

class StaticService extends GetxService with ConnectivityMixin {
  final _api = Get.find<StaticApi>();

  List<ServiceModel> services = [];
  List<CountryModel> countries = [];
  Map<String, List<CityModel>> cities = {};

  final _box = GetStorage('static');

  final updater = false.obs;
  void update() => updater.value = !updater.value;

  @override
  Future<void> onInit() async {
    await Get.find<UserService>().completer.future;
    final _services = _box.read<List<dynamic>>('services');
    if (_services != null) services = _services.map((s) => ServiceModel.fromJson(s)).toList();

    final _countries = _box.read<List<dynamic>>('countries');
    if (_countries == null)
      onConnection(getCountries, 'getCountries');
    else {
      countries.addAll(_countries.map((c) => CountryModel.fromJson(c)));
      update();
      if (countries.isNotEmpty) onConnection(() => getCities(countries.first.id), 'getCities${countries.first.id}');
    }
  }

  Future<void> getCountries() async {
    countries = await _api.getCountries();
    _box.write('countries', countries.map((b) => b.toJson()).toList());
    update();
    if (countries.isNotEmpty) getCities(countries.first.id);
  }

  Future<void> getCities(String countryId) async {
    final boxKey = 'cities$countryId';
    if (_box.hasData(boxKey)) {
      final _cities = _box.read<List<dynamic>>(boxKey);
      cities[countryId] = _cities.map((s) => CityModel.fromJson(s)).toList();
    } else {
      cities[countryId] = await _api.getCities(int.parse(countryId));
      _box.write(boxKey, cities[countryId].map((b) => b.toJson()).toList());
    }
    update();
    return cities[countryId];
  }
}
