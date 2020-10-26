import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';

class ProfileBlocks extends StatelessWidget {
  const ProfileBlocks({
    @required this.firstOnTap,
    @required this.secondOnTap,
    this.isBarber = false,
  });

  final bool isBarber;
  final Function() firstOnTap;
  final Function() secondOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: firstOnTap,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BRColors.almostWhite),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isBarber ? Icons.face : Icons.add,
                    size: 40,
                    color: BRColors.barRed,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isBarber ? "Перейти в профиль барбера" : "Стать барбером",
                    style: BRStyle.black14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: secondOnTap,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: BRColors.almostWhite),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.exit_to_app, size: 40, color: BRColors.barRed),
                  SizedBox(height: 10),
                  Text("Выйти", style: BRStyle.black14, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
