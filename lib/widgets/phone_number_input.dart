import 'package:flutter/material.dart';

import 'package:barbers/res/res.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    Key key,
    this.controller,
    this.maskFormatter,
    this.prefixes,
    this.currentPrefix,
    this.onChange,
    this.onChangePrefix,
    this.focusNode,
  }) : super(key: key);
  final TextEditingController controller;
  final MaskTextInputFormatter maskFormatter;
  final List<String> prefixes;
  final String currentPrefix;
  final FocusNode focusNode;
  final Function(String) onChange;
  final Function(String) onChangePrefix;

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  @override
  void initState() {
    _dropDownMenuItems = prepareItems();
    super.initState();
  }

  List<DropdownMenuItem<String>> prepareItems() {
    final List<DropdownMenuItem<String>> items = [];
    for (final prefix in widget.prefixes) {
      items.add(
        DropdownMenuItem(
          value: prefix,
          child: Text(
            prefix,
            style: BRStyle.black16,
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              items: _dropDownMenuItems,
              value: widget.currentPrefix,
              onChanged: (_) => widget.onChangePrefix(_),
              underline: Container(),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: widget.controller,
                inputFormatters: [widget.maskFormatter],
                focusNode: widget.focusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Номер телефона',
                  hintStyle: BRStyle.text14,
                  counterText: "",
                ),
                maxLength: 15,
                onChanged: widget.onChange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          width: 270,
          decoration: const BoxDecoration(color: BRColors.divider),
        ),
      ],
    );
  }
}
