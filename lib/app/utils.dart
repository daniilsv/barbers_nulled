import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';

class Utils {
  static List<String> month = [
    Strings.current.january,
    Strings.current.february,
    Strings.current.march,
    Strings.current.april,
    Strings.current.may,
    Strings.current.june,
    Strings.current.july,
    Strings.current.august,
    Strings.current.september,
    Strings.current.october,
    Strings.current.november,
    Strings.current.december,
  ];

  static String getDayString({DateTime dateTime}) {
    final DateTime now = DateTime.now();
    if (dateTime.year != now.year) {
      if (dateTime.year == now.year + 1) {
        return 'В следующем году';
      } else if (dateTime.year == now.year - 1) {
        return 'В прошлом году';
      } else {
        return null;
      }
    }
    if (dateTime.month != now.month) {
      if (dateTime.month == now.month + 1) {
        return 'В следующем месяце';
      } else if (dateTime.month == now.month - 1) {
        return 'В прошлом месяце';
      } else {
        return null;
      }
    }
    if (dateTime.day == now.day) {
      return Strings.current.today;
    } else if (dateTime.day == now.day + 1) {
      return Strings.current.tomorrow;
    } else if (dateTime.day == now.day - 1) {
      return 'Вчера';
    } else {
      return null;
    }
  }

  static String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  static String getHourMinuteString({DateTime dateTime, String stringTime}) {
    final time = dateTime ?? DateTime.parse(stringTime);
    return '${twoDigits(time.hour)}:${twoDigits(time.minute)}';
  }

  static String getMonthDayString({DateTime dateTime, String stringTime}) {
    final time = dateTime ?? DateTime.parse(stringTime);
    return '${time.day} ${month[time.month - 1]}';
  }

  static String getMonthDateString({DateTime dateTime, String stringTime}) {
    final time = dateTime ?? DateTime.parse(stringTime);
    return '${twoDigits(time.day)}.${twoDigits(time.month)}.${time.year}';
  }

  static String getNoun(int number, String one, String two, String five) {
    int _number = number.abs();
    _number %= 100;
    if (_number >= 5 && _number <= 20) {
      return five;
    }
    _number %= 10;
    if (_number == 1) {
      return one;
    }
    if (_number >= 2 && _number <= 4) {
      return two;
    }
    return five;
  }

  static Future<void> launchGoogleMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    return launchUrl(url);
  }

  static Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String randomString(int len) {
    final r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
