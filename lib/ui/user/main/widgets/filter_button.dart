import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserMainPageViewModel>(
      init: Get.find<UserMainPageViewModel>(),
      autoRemove: false,
      builder: (model) {
        return InkWell(
          onTap: () {
            // Get.bottomSheet(FilterBottomSheet(), isScrollControlled: true);
          },
          child: SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icons/filter.png',
                  width: 16,
                  height: 16,
                ),
                if (model.isFiltered)
                  Positioned(
                    bottom: 16,
                    right: 14,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: BRColors.barRed.withOpacity(.9),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
