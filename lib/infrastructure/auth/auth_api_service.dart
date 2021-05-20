import 'package:dio/dio.dart';

import '../../domain/auth/auth_data.dart';
import '../../domain/auth/login_request.dart';
import '../constants.dart';

class AuthApiService {
  final _dio = Dio();

  Future<dynamic> login(LoginRequest loginRequest) async {
    AuthData authData;

    var formData = FormData.fromMap({
      'data[phone]': '${loginRequest.phone}',
      'data[password]': '${loginRequest.password}',
    });

    var response = await _dio.post(
      '${apiUrl}/arsenal/auth/login/',
      data: formData,
    );

    var data = response.data;
    authData = AuthData.fromJson(data);

    return authData;
  }
}
