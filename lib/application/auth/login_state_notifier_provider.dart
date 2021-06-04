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
            phone: '3807461887',
            password: '3807461887',
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

  void clearFields() {
    state = LoginRequest(
      phone: '',
      password: '',
    );
  }
}
