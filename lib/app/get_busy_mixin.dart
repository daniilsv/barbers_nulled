// ignore_for_file: use_setters_to_change_properties
// ignore_for_file: avoid_positional_boolean_parameters
import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin GetBusyMixin {
  final _isBusy = false.obs;
  bool get isBusy => _isBusy.value;

  void setBusy(bool value) {
    _isBusy.value = value;
  }
}

extension BusyStack on Widget {
  Widget withBusyStack(GetBusyMixin controller) {
    return Stack(
      children: [
        this,
        Positioned.fill(
          child: Obx(
            () {
              return IgnorePointer(
                ignoring: !controller._isBusy.value,
                child: AnimatedOpacity(
                  opacity: controller._isBusy.value ? 1 : 0,
                  duration: 200.milliseconds,
                  child: Container(
                    decoration: BoxDecoration(
                      color: BRColors.lightGrey.withOpacity(0.5),
                    ),
                    alignment: Alignment.center,
                    child: LoadingWidget(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
