import 'register_api_service.dart';

import '../../domain/auth/registration/sms_request.dart';
import '../../domain/auth/registration/phone_request.dart';

class RegisterService {
  final _resetService = RegistrationApiService();

  Future<dynamic> registerByPhone(String phone) {
    return _resetService.resetByPhone(phone);
  }

  Future<dynamic> registerBySms(SmsRequest smsRequest, String token) {
    return _resetService.resetBySms(smsRequest, token);
  }

  Future<dynamic> setPassword(String pass, String newPass, String token) {
    return _resetService.changePassword(pass, newPass, token);
  }
}
