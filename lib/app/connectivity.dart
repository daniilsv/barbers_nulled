import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

import 'utils.dart';

class ConnectivityService extends GetxService {
  ConnectivityResult status;
  bool get hasConnection => status != ConnectivityResult.none;
  final List<void Function(bool hasConnection)> _listeners = [];
  @override
  Future<void> onInit() async {
    status = await Connectivity().checkConnectivity();
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == status) return;
      status = event;
      for (final cb in _listeners) cb(status != ConnectivityResult.none);
    });
  }

  void _listen(void Function(bool hasConnection) cb) {
    if (cb == null) return;
    _listeners.add(cb);
  }
}

mixin ConnectivityMixin on DisposableInterface {
  bool get hasConnection => Get.find<ConnectivityService>().status != ConnectivityResult.none;
  final Map<String, void Function()> _onNextConnection = {};
  @override
  void onInit() {
    Get.find<ConnectivityService>()._listen((has) {
      onConnectivityChanged(has);
      if (has) {
        for (final cb in _onNextConnection.values)
          try {
            cb.call();
          } finally {}
        _onNextConnection.clear();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _onNextConnection.clear();
    super.onClose();
  }

  // ignore: avoid_positional_boolean_parameters
  void onConnectivityChanged(bool hasConnection) {}

  void onConnection(void Function() cb, [String tag]) {
    if (cb == null) return;
    if (hasConnection)
      try {
        cb.call();
      } finally {}
    else
      _onNextConnection[tag ?? Utils.randomString(10)] = cb;
  }
}
