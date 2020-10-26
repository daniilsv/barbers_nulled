import 'package:barbers/res/res.dart';
import 'package:flutter/cupertino.dart';

class RedButton extends StatelessWidget {
  const RedButton({
    this.text,
    this.style = BRStyle.white12,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
    this.onTap,
  });
  const RedButton.big({
    this.text,
    this.style = BRStyle.white16,
    this.padding = const EdgeInsets.all(50),
    this.onTap,
  });

  final String text;
  final TextStyle style;
  final EdgeInsetsGeometry padding;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.zero,
      pressedOpacity: 0.8,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/button.png'),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        padding: padding,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
