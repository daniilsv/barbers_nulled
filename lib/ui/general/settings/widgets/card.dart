import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    this.title,
    this.onTap,
    this.image,
  });
  final String title;
  final Function onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 36, height: 36),
            const SizedBox(width: 24),
            Text(title, style: BRStyle.textBlack14)
          ],
        ),
      ),
    );
  }
}
