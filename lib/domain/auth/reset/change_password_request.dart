import 'package:flutter/foundation.dart';

class ChangePasswordRequest {
  ChangePasswordRequest({
    @required this.password,
    @required this.passwordConfirm,
  });

  final String password;
  final String passwordConfirm;
}
