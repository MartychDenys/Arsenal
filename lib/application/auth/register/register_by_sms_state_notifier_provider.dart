import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/auth/registration/sms_request.dart';

final registerBySmsStateNotifierProvider =
    StateNotifierProvider.autoDispose<ResetBySms>(
  (ref) => ResetBySms(),
);

class ResetBySms extends StateNotifier<SmsRequest> {
  ResetBySms()
      : super(
          SmsRequest(
            code: '',
          ),
        );

  void updateCode(String code) {
    state = SmsRequest(
      code: code,
    );
  }

  void clearFields() {
    state = SmsRequest(
      code: '',
    );
  }
}
