import '../../constants/regular_expressions.dart';

String validateTime(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (!_checkTimeRegexp(value)) {
    return 'Введіть корректний час.';
  } else {
    return null;
  }
}

bool _checkTimeRegexp(String date) {
  return RegExp(timeRegExp).hasMatch(date);
}
