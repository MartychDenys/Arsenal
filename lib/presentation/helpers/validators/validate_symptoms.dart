import '../../constants/regular_expressions.dart';

String validateSymptomsAlreadySigned(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (value.length > 250) {
    return 'Будь ласка спробуйте описати коротше.';
  } else if (!_checkSymptomsAlreadyRegexp(value)) {
    return 'Введіть корректні дані.';
  } else {
    return null;
  }
}

bool _checkSymptomsAlreadyRegexp(String symptoms) {
  return RegExp(symptomsAlreadySignedRegExp).hasMatch(symptoms);
}

String validateSymptomsDoctorCoupon(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (value.length > 250) {
    return 'Будь ласка спробуйте описати коротше.';
  } else if (!_checkSymptomsDocRegexp(value)) {
    return 'Введіть корректні дані.';
  } else {
    return null;
  }
}

bool _checkSymptomsDocRegexp(String symptoms) {
  return RegExp(symptomsDoctorCouponRegExp).hasMatch(symptoms);
}
