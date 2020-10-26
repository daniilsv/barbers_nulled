import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/res/res.dart';
import 'package:barbers/widgets/avatar_image.dart';
import 'package:barbers/widgets/rating_badge.dart';
import 'package:barbers/widgets/red_button.dart';
import 'package:flutter/material.dart';

class BarberCard extends StatelessWidget {
  const BarberCard({this.barber, this.onTapCall});
  final BarberModel barber;
  final void Function() onTapCall;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.to<void>(BarbersCard(barber: barber)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(url: barber?.user?.photo),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        barber.user?.name ?? 'Нет имени',
                        style: BRStyle.black20,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          barber.services.map((_) => _.title).join('  ᛫  '),
                          style: BRStyle.text14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        barber.about ?? 'Нет описания',
                        style: BRStyle.text14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBadge(rating: barber.rating ?? 0),
                RedButton(
                  text: 'Позвонить',
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                  style: BRStyle.white10,
                  onTap: onTapCall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
