import '../../constants/regular_expressions.dart';

String validateComment(String value) {
  if (!value.isEmpty) {
    if (value.length > 250) {
      return 'Будь ласка спробуйте описати коротше.';
    } else if (value.length < 5) {
      return 'Будь ласка спробуйте описати детальніше.';
    } else if (!_checkCommentRegexp(value)) {
      return 'Введіть корректні дані.';
    }
  } else {
    return null;
  }
}

bool _checkCommentRegexp(String data) {
  return RegExp(commentRegExp).hasMatch(data);
}
