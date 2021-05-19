import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/reset/phone_request.dart';

final resetByPhoneStateNotifierProvider =
    StateNotifierProvider.autoDispose<ResetByPhone>(
  (ref) => ResetByPhone(),
);

class ResetByPhone extends StateNotifier<PhoneRequest> {
  ResetByPhone()
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
