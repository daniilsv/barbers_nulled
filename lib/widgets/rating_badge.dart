import 'package:barbers/res/res.dart';
import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({Key key, this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: BRColors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/star.png',
            width: 10,
            height: 10,
          ),
          const SizedBox(width: 8),
          Text(
            '${rating?.toStringAsFixed(1) ?? 0.0}',
            style: BRStyle.black14.copyWith(color: BRColors.textGrey),
          )
        ],
      ),
    );
  }
}
