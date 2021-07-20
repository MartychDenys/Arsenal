import '../../constants/regular_expressions.dart';

String validateDate(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (!_checkDateRegexp(value)) {
    return 'Введіть корректну дату.';
  } else {
    return null;
  }
}

bool _checkDateRegexp(String date) {
  return RegExp(dateRegExp).hasMatch(date);
}
