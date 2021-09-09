import '../../domain/auth/login_request.dart';
import 'auth_api_service.dart';

class AuthService {
  final _authApiService = AuthApiService();

  Future<dynamic> login(String phone, String password) {
    return _authApiService.login(phone, password);
  }
}
