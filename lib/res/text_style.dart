part of 'res.dart';

class BRStyle extends TextStyle {
  const BRStyle.create({
    String fontFamily,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    Color color,
  }) : super(
          fontFamily: fontFamily ?? 'HelveticaNeueCyr',
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color ?? BRColors.black,
        );

  static const TextStyle black48 = BRStyle.create(fontSize: 48);
  static const TextStyle black20 = BRStyle.create(fontSize: 20, fontWeight: FontWeight.w500);
  static const TextStyle black18 = BRStyle.create(fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle black16 = BRStyle.create(fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle black14 = BRStyle.create(fontSize: 14, fontWeight: FontWeight.w500);
  
  static const TextStyle red14 = BRStyle.create(fontSize: 14, color: BRColors.barRed, fontWeight: FontWeight.w500);
  static const TextStyle red16 = BRStyle.create(fontSize: 16, color: BRColors.barRed);

  static const TextStyle search = BRStyle.create(fontSize: 12, color: BRColors.darkGrey, fontWeight: FontWeight.w500);

  static const TextStyle text16 = BRStyle.create(fontSize: 16, color: BRColors.text);
  static const TextStyle text14 = BRStyle.create(fontSize: 14, color: BRColors.text);
  static const TextStyle textBlack14 = BRStyle.create(fontSize: 14);
  static const TextStyle text12 = BRStyle.create(fontSize: 12, color: BRColors.text, fontWeight: FontWeight.w500);

  static const TextStyle white16 = BRStyle.create(fontSize: 16, color: BRColors.white, fontWeight: FontWeight.w500);
  static const TextStyle white14 = BRStyle.create(fontSize: 14, color: BRColors.white, fontWeight: FontWeight.w500);
  static const TextStyle white12 = BRStyle.create(fontSize: 12, color: BRColors.white, fontWeight: FontWeight.w500);

  static const TextStyle white10 = BRStyle.create(fontSize: 10, color: BRColors.white);
}
