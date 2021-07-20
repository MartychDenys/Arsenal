import 'package:flutter/foundation.dart';

class SetPasswordRequest {
  SetPasswordRequest({
    @required this.password,
    @required this.passwordConfirm,
  });

  final String password;
  final String passwordConfirm;
}
