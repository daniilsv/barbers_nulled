import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/background.dart';
import 'package:barbers/app/get_busy_mixin.dart';
import 'package:barbers/app/unfocus_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'viewmodel.dart';
import 'widgets/card.dart';

class UserFavoritesPageView extends StatelessWidget {
  final model = Get.put(UserFavoritesPageViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserFavoritesPageViewModel>(
      init: model,
      builder: (model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Избранное', style: BRStyle.black14),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 24, right: 24, top: 6, bottom: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: TextField(
                    controller: model.searchController,
                    focusNode: model.focusNode,
                    onChanged: model.search,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset('assets/icons/search.png'),
                      ),
                      prefixIconConstraints: const BoxConstraints(maxHeight: 16, maxWidth: 48),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      hintText: 'Поиск',
                      hintStyle: BRStyle.text12.copyWith(color: BRColors.darkGrey),
                      filled: true,
                      fillColor: BRColors.white,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: model.refresh,
                  color: BRColors.barRed,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Expanded(
                        child: (model.barbers?.length ?? 0) == 0
                            ? ListView(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Барберы не найдены',
                                      style: BRStyle.black14,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                itemCount: model.barbers.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      BarberCard(
                                        barber: model.barbers[index],
                                        onTapDelete: () => model.onRemove(model.barbers[index]),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).withBackground().unfocusOnTap().withBusyStack(model),
        );
      },
    );
  }
}
