import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barbers/widgets/background.dart';

import 'data.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Помощь', style: BRStyle.black14),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ValueBuilder<Map<int, bool>>(
          initialValue: const {},
          builder: (value, updateFn) => ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              final _ = Map.of(value);
              _[index] = !isExpanded;
              updateFn(_);
            },
            expandedHeaderPadding: EdgeInsets.zero,
            children: List.generate(
              HelpData.tiles.length,
              (int index) {
                return ExpansionPanel(
                  isExpanded: value[index] ?? false,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(HelpData.tiles[index].title),
                    ).paddingSymmetric(vertical: 12);
                  },
                  body: ListTile(
                    contentPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    subtitle: Text(HelpData.tiles[index].text),
                  ),
                );
              },
            ),
          ).paddingOnly(top: 16),
        ),
      ).withBackground(),
    );
  }
}
