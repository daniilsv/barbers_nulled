import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension BackgroundWidget on Widget {
  Widget withBackground() {
    return Background(child: this);
  }
}

class Background extends StatelessWidget {
  final String backgroundImage;
  final Widget child;

  const Background({
    @required this.child,
    this.backgroundImage = "assets/images/background.png",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: child,
    );
  }
}
