import '../../domain/auth/refresh_request.dart';
import 'services/auth_refresh_service.dart';
import 'auth_api_service.dart';

class AuthService {
  final _authApiService = AuthApiService();
  final _authRefreshService = AuthRefreshService();

  Future<dynamic> login(String phone, String password) {
    return _authApiService.login(phone, password);
  }

  Future<dynamic> refreshToken(RefreshRequest refreshRequest) {
    return _authRefreshService.refreshToken(refreshRequest);
  }
}
