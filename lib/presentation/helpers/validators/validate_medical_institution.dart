import '../../constants/regular_expressions.dart';

String validateMedicalInstitution(String value) {
  if (value.isEmpty) {
    return 'Це поле не може бути пустим.';
  } else if (value.length > 50) {
    return 'Будь ласка спробуйте описати коротше.';
  } else if (!_checkSymptomsRegexp(value)) {
    return 'Введіть корректні дані.';
  } else {
    return null;
  }
}

bool _checkSymptomsRegexp(String data) {
  return RegExp(medInstitutionRegExp).hasMatch(data);
}

String validateMedicalInstitutionDoctorCoupon(String value) {
  if (!value.isEmpty) {
    if (value.length > 250) {
      return 'Будь ласка спробуйте описати коротше.';
    } else if (!_checkSymptomsDoctorCouponRegexp(value)) {
      return 'Введіть корректні дані.';
    }
  } else {
    return null;
  }
}

bool _checkSymptomsDoctorCouponRegexp(String data) {
  return RegExp(medInstitutionDoctorCouponRegExp).hasMatch(data);
}

