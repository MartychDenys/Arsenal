import 'package:easy_localization/easy_localization.dart';

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'password_blank_error'.tr();
  } else {
    return null;
  }
}
