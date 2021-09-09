import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/login_request.dart';

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier>(
  (ref) => LoginStateNotifier(),
);

class LoginStateNotifier extends StateNotifier<LoginRequest> {
  LoginStateNotifier()
      : super(
          LoginRequest(
            phone: '',
            password: '',
          ),
        );

  void updatePhone(String phone) {
    state = LoginRequest(
      phone: phone,
      password: state.password,
    );
  }

  void updatePassword(String password) {
    state = LoginRequest(
      phone: state.phone,
      password: password,
    );
  }

  String getPhoneNumber() {
    return state.phone;
  }

  void clearFields() {
    state = LoginRequest(
      phone: '',
      password: '',
    );
  }

  String get phoneGet => state.phone;
}
