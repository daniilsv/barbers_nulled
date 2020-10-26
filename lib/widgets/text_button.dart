import 'package:barbers/res/res.dart';
import 'package:flutter/cupertino.dart';

class UnderlinedButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final TextStyle textStyle;
  final Color lineColor;

  const UnderlinedButton({
    @required this.text,
    this.onTap,
    this.textStyle = BRStyle.black14,
    this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      pressedOpacity: 0.6,
      child: Container(
        padding: const EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: lineColor ?? textStyle.color)),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
