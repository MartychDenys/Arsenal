import '../../../domain/auth/registration/phone_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerDataStateNotifierProvider =
    StateNotifierProvider<RegisterDataStateNotifier>(
  (ref) => RegisterDataStateNotifier(),
);

class RegisterDataStateNotifier extends StateNotifier<PhoneResponse> {
  RegisterDataStateNotifier() : super(null);

  void updateData(PhoneResponse response) {
    state = PhoneResponse(
      message: response.message,
      token: response.token,
    );
  }

  void registerData() {
    state = null;
  }
}
