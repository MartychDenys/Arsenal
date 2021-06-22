import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/registration/set_password_request.dart';

final setPasswordStateNotifierProvider =
    StateNotifierProvider.autoDispose<SetPasswordStateNotifier>(
  (ref) => SetPasswordStateNotifier(),
);

class SetPasswordStateNotifier extends StateNotifier<SetPasswordRequest> {
  SetPasswordStateNotifier()
      : super(
          SetPasswordRequest(
            password: '',
            passwordConfirm: '',
          ),
        );

  void updatePassword(String password) {
    state = SetPasswordRequest(
      password: password,
      passwordConfirm: state.passwordConfirm,
    );
  }

  void updatePasswordConfirm(String passwordConfirm) {
    state = SetPasswordRequest(
      password: state.password,
      passwordConfirm: passwordConfirm,
    );
  }

  void clearFields() {
    state = SetPasswordRequest(
      password: '',
      passwordConfirm: '',
    );
  }
}
