// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

getTranslateString({
  required String lang,
  required String stringFr,
  required String stringEn,
}) {
  switch (lang) {
    case 'fr_FR':
      return stringFr;
    case 'en_US':
      return stringEn;
    default:
      return stringFr;
  }
}

String showSystemeDate({
  required DateTime date,
}) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

String showDate({
  required String lang,
  required DateTime date,
}) {
  String langue = '';
  if (lang == 'fr_FR' || lang == 'fr') {
    langue = 'fr_FR';
    return DateFormat.yMd(langue).format(date.toLocal()).toString();
  } else {
    langue = 'en_EN';
    return DateFormat.yMd(langue).format(date.toLocal()).toString();
  }
}

String showDateWithDay({
  required String lang,
  required DateTime date,
}) {
  String langue = '';
  if (lang == 'fr_FR' || lang == 'fr') {
    langue = 'fr_FR';
    return DateFormat.yMMMMEEEEd(langue).format(date.toLocal()).toString();
  } else {
    langue = 'en_EN';
    return DateFormat.yMMMMEEEEd(langue).format(date.toLocal()).toString();
  }
}

String showDateAndTime({
  required String lang,
  required DateTime date,
}) {
  String langue = '';
  if (lang == 'fr_FR' || lang == 'fr') {
    langue = 'fr_FR';
    return DateFormat.yMMMMd(langue)
        .addPattern('à')
        .add_Hm()
        .format(date.toLocal())
        .toString();
  } else {
    langue = 'en_EN';
    return DateFormat.yMMMMd(langue).add_Hm().format(date.toLocal()).toString();
  }
}

String showTime({
  required String lang,
  required DateTime date,
}) {
  String langue = '';
  if (lang == 'fr_FR' || lang == 'fr') {
    langue = 'fr_FR';
    return DateFormat.Hm(langue)
        .format(date.toLocal())
        .toString()
        .replaceAll(':', 'H');
  } else {
    langue = 'en_EN';
    return DateFormat.Hm(langue).format(date.toLocal()).toString();
  }
}

DateFormat getFormatFromLang({
  required String lang,
}) {
  String langue = '';
  if (lang == 'fr_FR' || lang == 'fr') {
    langue = 'fr_FR';
    return DateFormat.yMMMMd(langue);
  } else {
    langue = 'en_EN';
    return DateFormat.yMMMMd(langue);
  }
}
