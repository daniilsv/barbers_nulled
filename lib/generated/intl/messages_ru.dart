// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static m0(city) => "Город: ${city}";

  static m1(howMany) => "${Intl.plural(howMany, one: '${howMany} год', few: '${howMany} года', other: '${howMany} лет')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actual" : MessageLookupByLibrary.simpleMessage("Актуальные"),
    "april" : MessageLookupByLibrary.simpleMessage("Апреля"),
    "august" : MessageLookupByLibrary.simpleMessage("Августа"),
    "cancel" : MessageLookupByLibrary.simpleMessage("Отмена"),
    "change" : MessageLookupByLibrary.simpleMessage("Изменить"),
    "city" : m0,
    "complain" : MessageLookupByLibrary.simpleMessage("Пожаловаться"),
    "december" : MessageLookupByLibrary.simpleMessage("Декабря"),
    "detailedInformation" : MessageLookupByLibrary.simpleMessage("Подробная информация"),
    "edit" : MessageLookupByLibrary.simpleMessage("Редактировать"),
    "enterSMSCode" : MessageLookupByLibrary.simpleMessage("Введите код из СМС"),
    "exit" : MessageLookupByLibrary.simpleMessage("Выход"),
    "february" : MessageLookupByLibrary.simpleMessage("Февраля"),
    "help" : MessageLookupByLibrary.simpleMessage("Помощь"),
    "history" : MessageLookupByLibrary.simpleMessage("История"),
    "january" : MessageLookupByLibrary.simpleMessage("Января"),
    "join" : MessageLookupByLibrary.simpleMessage("Присоединиться"),
    "july" : MessageLookupByLibrary.simpleMessage("Июля"),
    "june" : MessageLookupByLibrary.simpleMessage("Июня"),
    "list" : MessageLookupByLibrary.simpleMessage("Список"),
    "loading" : MessageLookupByLibrary.simpleMessage("Идет загрузка"),
    "login" : MessageLookupByLibrary.simpleMessage("Вход"),
    "march" : MessageLookupByLibrary.simpleMessage("Марта"),
    "may" : MessageLookupByLibrary.simpleMessage("Мая"),
    "notValidName" : MessageLookupByLibrary.simpleMessage("Имя должно состоять минимум из двух символов"),
    "notValidNameSpec" : MessageLookupByLibrary.simpleMessage("Имя не должно содержать спец. символов"),
    "november" : MessageLookupByLibrary.simpleMessage("Ноября"),
    "october" : MessageLookupByLibrary.simpleMessage("Октября"),
    "ok" : MessageLookupByLibrary.simpleMessage("ОК"),
    "password" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "phoneNumber" : MessageLookupByLibrary.simpleMessage("Номер телефона"),
    "proceed" : MessageLookupByLibrary.simpleMessage("Далее"),
    "profile" : MessageLookupByLibrary.simpleMessage("Профиль"),
    "ready" : MessageLookupByLibrary.simpleMessage("Готово"),
    "registration" : MessageLookupByLibrary.simpleMessage("Регистрация"),
    "requestIsProcessing" : MessageLookupByLibrary.simpleMessage("Заявка обрабатывается"),
    "retry" : MessageLookupByLibrary.simpleMessage("Повторить"),
    "send" : MessageLookupByLibrary.simpleMessage("Отправить"),
    "sendCodeAgain" : MessageLookupByLibrary.simpleMessage("Отправить код еще раз"),
    "september" : MessageLookupByLibrary.simpleMessage("Сентября"),
    "settings" : MessageLookupByLibrary.simpleMessage("Настройки"),
    "shouldBeFilled" : MessageLookupByLibrary.simpleMessage("Поле обязательно для заполнения"),
    "today" : MessageLookupByLibrary.simpleMessage("Сегодня"),
    "tomorrow" : MessageLookupByLibrary.simpleMessage("Завтра"),
    "years" : m1
  };
}
