// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class Strings {
  Strings();
  
  static Strings current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Strings.current = Strings();
      
      return Strings.current;
    });
  } 

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `{howMany, plural, one{{howMany} год} few{{howMany} года} other{{howMany} лет}}`
  String years(num howMany) {
    return Intl.plural(
      howMany,
      one: '$howMany год',
      few: '$howMany года',
      other: '$howMany лет',
      name: 'years',
      desc: '',
      args: [howMany],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registration {
    return Intl.message(
      'Регистрация',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get login {
    return Intl.message(
      'Вход',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Имя должно состоять минимум из двух символов`
  String get notValidName {
    return Intl.message(
      'Имя должно состоять минимум из двух символов',
      name: 'notValidName',
      desc: '',
      args: [],
    );
  }

  /// `Имя не должно содержать спец. символов`
  String get notValidNameSpec {
    return Intl.message(
      'Имя не должно содержать спец. символов',
      name: 'notValidNameSpec',
      desc: '',
      args: [],
    );
  }

  /// `Поле обязательно для заполнения`
  String get shouldBeFilled {
    return Intl.message(
      'Поле обязательно для заполнения',
      name: 'shouldBeFilled',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get phoneNumber {
    return Intl.message(
      'Номер телефона',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `ОК`
  String get ok {
    return Intl.message(
      'ОК',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Отправить`
  String get send {
    return Intl.message(
      'Отправить',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Отправить код еще раз`
  String get sendCodeAgain {
    return Intl.message(
      'Отправить код еще раз',
      name: 'sendCodeAgain',
      desc: '',
      args: [],
    );
  }

  /// `Повторить`
  String get retry {
    return Intl.message(
      'Повторить',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Введите код из СМС`
  String get enterSMSCode {
    return Intl.message(
      'Введите код из СМС',
      name: 'enterSMSCode',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get ready {
    return Intl.message(
      'Готово',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Идет загрузка`
  String get loading {
    return Intl.message(
      'Идет загрузка',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Января`
  String get january {
    return Intl.message(
      'Января',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `Февраля`
  String get february {
    return Intl.message(
      'Февраля',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `Марта`
  String get march {
    return Intl.message(
      'Марта',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `Апреля`
  String get april {
    return Intl.message(
      'Апреля',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `Мая`
  String get may {
    return Intl.message(
      'Мая',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `Июня`
  String get june {
    return Intl.message(
      'Июня',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `Июля`
  String get july {
    return Intl.message(
      'Июля',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `Августа`
  String get august {
    return Intl.message(
      'Августа',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `Сентября`
  String get september {
    return Intl.message(
      'Сентября',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `Октября`
  String get october {
    return Intl.message(
      'Октября',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `Ноября`
  String get november {
    return Intl.message(
      'Ноября',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `Декабря`
  String get december {
    return Intl.message(
      'Декабря',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Сегодня`
  String get today {
    return Intl.message(
      'Сегодня',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Завтра`
  String get tomorrow {
    return Intl.message(
      'Завтра',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Далее`
  String get proceed {
    return Intl.message(
      'Далее',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Изменить`
  String get change {
    return Intl.message(
      'Изменить',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Актуальные`
  String get actual {
    return Intl.message(
      'Актуальные',
      name: 'actual',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get history {
    return Intl.message(
      'История',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Список`
  String get list {
    return Intl.message(
      'Список',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Присоединиться`
  String get join {
    return Intl.message(
      'Присоединиться',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Заявка обрабатывается`
  String get requestIsProcessing {
    return Intl.message(
      'Заявка обрабатывается',
      name: 'requestIsProcessing',
      desc: '',
      args: [],
    );
  }

  /// `Пожаловаться`
  String get complain {
    return Intl.message(
      'Пожаловаться',
      name: 'complain',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Помощь`
  String get help {
    return Intl.message(
      'Помощь',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get exit {
    return Intl.message(
      'Выход',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Подробная информация`
  String get detailedInformation {
    return Intl.message(
      'Подробная информация',
      name: 'detailedInformation',
      desc: '',
      args: [],
    );
  }

  /// `Город: {city}`
  String city(Object city) {
    return Intl.message(
      'Город: $city',
      name: 'city',
      desc: '',
      args: [city],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}