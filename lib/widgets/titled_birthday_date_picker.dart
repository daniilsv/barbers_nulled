import 'dart:io';

import 'package:barbers/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitledBirthdayDatePicker extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final String title;
  const TitledBirthdayDatePicker({this.onDateChanged, this.title});

  @override
  _TitledBirthdayDatePickerState createState() => _TitledBirthdayDatePickerState();
}

class _TitledBirthdayDatePickerState extends State<TitledBirthdayDatePicker> {
  String text = "Дата рождения";
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: BRColors.divider)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.title ?? "",
                style: BRStyle.text16,
              ),
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateSelected,
              initialDateTime: DateTime(1980),
              mode: CupertinoDatePickerMode.date,
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
            ),
          );
        },
      );
    } else {
      showDatePicker(
        context: context,
        initialDate: DateTime(1980),
        locale: Localizations.localeOf(context),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ).then(onDateSelected);
    }
  }

  void onDateSelected(DateTime date) {
    if (date != null) {
      widget.onDateChanged(date);
      setState(() {
        text = DateFormat("dd.MM.yyyy").format(date);
      });
    }
  }
}
