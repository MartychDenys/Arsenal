import '../../domain/auth/reset/phone_request.dart';
import 'reset_api_service.dart';

class ResetService {
  final _resetService = ResetApiService();

  Future<dynamic> resetByPhone(PhoneRequest phoneRequest) {
    return _resetService.resetByPhone(phoneRequest);
  }
}
