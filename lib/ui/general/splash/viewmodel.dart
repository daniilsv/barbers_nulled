import 'dart:async';

import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class SplashController extends GetxController {
  final Duration tickDuration = 10.milliseconds;
  final double tickProgress = .01;

  final progress = 0.0.obs;
  Timer timer;

  @override
  void onInit() {
    progress.value = 0;
    timer = Timer.periodic(tickDuration, (_timer) {
      progress.value += tickProgress;
      if (progress.value >= 1) {
        _timer.cancel();
      }
    });
  }
}
