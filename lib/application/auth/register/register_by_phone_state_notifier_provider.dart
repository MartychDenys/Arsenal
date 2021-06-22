import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/registration/phone_request.dart';

final registerByPhoneStateNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterByPhone>(
  (ref) => RegisterByPhone(),
);

class RegisterByPhone extends StateNotifier<PhoneRequest> {
  RegisterByPhone()
      : super(
          PhoneRequest(
            phone: '',
          ),
        );

  void updatePhone(String phone) {
    state = PhoneRequest(
      phone: phone,
    );
  }

  void clearFields() {
    state = PhoneRequest(
      phone: '',
    );
  }
}
