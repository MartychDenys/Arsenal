import '../../constants/regular_expressions.dart';

String validateDoctorName(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (value.length > 50) {
    return 'Будь ласка спробуйте описати коротше.';
  } else if (!_checkDocNameRegexp(value)) {
    return 'Введіть корректні дані.';
  } else {
    return null;
  }
}

bool _checkDocNameRegexp(String data) {
  return RegExp(docNameRegExp).hasMatch(data);
}
