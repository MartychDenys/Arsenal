import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/reset/phone_request.dart';

final resetBySmsStateNotifierProvider =
    StateNotifierProvider.autoDispose<ResetBySms>(
  (ref) => ResetBySms(),
);

class ResetBySms extends StateNotifier<PhoneRequest> {
  ResetBySms()
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
