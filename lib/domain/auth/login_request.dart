import 'package:flutter/foundation.dart';

class LoginRequest {
  LoginRequest({
    @required this.phone,
    @required this.password,
  });

  final String phone;
  final String password;
}
