import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/reset/change_password_request.dart';

final changePasswordStateNotifierProvider =
    StateNotifierProvider.autoDispose<ChangePasswordStateNotifier>(
  (ref) => ChangePasswordStateNotifier(),
);

class ChangePasswordStateNotifier extends StateNotifier<ChangePasswordRequest> {
  ChangePasswordStateNotifier()
      : super(
          ChangePasswordRequest(
            password: '',
            passwordConfirm: '',
          ),
        );

  void updatePassword(String password) {
    state = ChangePasswordRequest(
      password: password,
      passwordConfirm: state.passwordConfirm,
    );
  }

  void updatePasswordConfirm(String passwordConfirm) {
    state = ChangePasswordRequest(
      password: state.password,
      passwordConfirm: passwordConfirm,
    );
  }

  void clearFields() {
    state = ChangePasswordRequest(
      password: '',
      passwordConfirm: '',
    );
  }
}
