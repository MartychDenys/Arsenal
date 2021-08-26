import 'package:arsenal_app/infrastructure/insurance/insurance_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
    //
    // print('response.data ${response.data}');
    // print('response.statusCode ${response.statusCode}');
    // print('response.TOKEN ${response.data['data']['_token']}');
    // print('response.ID ${response.data}');
    // final insurance = await InsuranceService().getInsurance(response.data['data']['_token'], response.data['data']['id']);
    //
    // print('insurance STATUS ${insurance.status}');
    // print('insurance DATA ${insurance.data}');
    // print('insurance ${insurance}');

    var data = response.data;
    authData = AuthData.fromJson(data);

    print('authData TOKEN ${authData.data.token}');
    print('authData ID ${authData.data.id}');

    return authData;
  }
}
