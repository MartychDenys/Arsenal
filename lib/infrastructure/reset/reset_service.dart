import '../../domain/auth/reset/sms_request.dart';

import '../../domain/auth/reset/phone_request.dart';
import 'reset_api_service.dart';

class ResetService {
  final _resetService = ResetApiService();

  Future<dynamic> resetByPhone(String phone) {
    return _resetService.resetByPhone(phone);
  }

  Future<dynamic> resetBySms(SmsRequest smsRequest, String token) {
    return _resetService.resetBySms(smsRequest, token);
  }

  Future<dynamic> changePassword(String pass, String newPass, String token) {
    return _resetService.changePassword(pass, newPass, token);
  }
}
