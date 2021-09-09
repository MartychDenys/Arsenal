import 'package:dio/dio.dart';

import '../../domain/auth/auth_data.dart';
import '../../domain/auth/login_request.dart';
import '../constants.dart';

class AuthApiService {
  final _dio = Dio();

  Future<dynamic> login(String phoneNumber, String password) async {
    AuthData authData;
    final phone = phoneNumber.split(' ').join('');
    var formData = FormData.fromMap({
      'data[phone]': '380$phone',
      'data[password]': '$password',
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
