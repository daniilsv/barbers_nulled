import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 76,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50].withOpacity(.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(BRColors.barRed),
      ),
    );
  }
}
