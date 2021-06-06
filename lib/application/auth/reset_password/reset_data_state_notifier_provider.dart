import '../../../domain/auth/reset/phone_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final resetDataStateNotifierProvider =
    StateNotifierProvider<ResetDataStateNotifier>(
  (ref) => ResetDataStateNotifier(),
);

class ResetDataStateNotifier extends StateNotifier<PhoneResponse> {
  ResetDataStateNotifier() : super(null);

  void updateData(PhoneResponse response) {
    state = PhoneResponse(
      message: response.message,
      token: response.token,
    );
  }

  void resetData() {
    state = null;
  }
}
