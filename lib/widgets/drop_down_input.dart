import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';

class DropDownInput extends StatefulWidget {
  final List<String> options;
  final String value;
  final Function(String) onChoose;

  const DropDownInput({
    @required this.options,
    @required this.value,
    @required this.onChoose,
  });

  @override
  _DropDownInputState createState() => _DropDownInputState();
}

class _DropDownInputState extends State<DropDownInput> {
  List<DropdownMenuItem<String>> get _items => prepareItems();
  List<String> get options => widget.options;
  String get value => widget.value;
  Function(String) get onChoose => widget.onChoose;

  List<DropdownMenuItem<String>> prepareItems() {
    final items = value != null ? [value] : [];
    items.addAll(
      widget.options.where(
        (item) => item != value,
      ),
    );
    return List.generate(
      items.length,
      (index) => DropdownMenuItem(
        onTap: () => onChoose(items[index]),
        value: items[index],
        child: Text(
          items[index],
          style: BRStyle.text16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
          items: _items,
          value: value,
          onChanged: onChoose,
          isExpanded: true,
          underline: Container(),
        ),
        const SizedBox(height: 10),
        Container(
          height: 1,
          width: double.infinity,
          decoration: const BoxDecoration(color: BRColors.divider),
        ),
      ],
    );
  }
}
