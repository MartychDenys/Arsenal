import 'package:dio/dio.dart';

import '../../domain/auth/reset/sms_request.dart';
import '../../domain/auth/reset/sms_response_body.dart';
import '../../domain/auth/reset/phone_response_body.dart';
import '../../domain/auth/reset/change_password_response_body.dart';
import '../constants.dart';

class ResetApiService {
  final _dio = Dio();

  Future<dynamic> resetByPhone(String phoneNumber) async {
    PhoneResponseBody phoneResponseBody;
    final phone = phoneNumber.split(' ').join('');

    var formData = FormData.fromMap({
      'data[phone]': '380$phone',
    });

    var response = await _dio.post(
      '${apiUrl}/arsenal/auth/forgot/',
      data: formData,
    );

    var data = response.data;
    phoneResponseBody = PhoneResponseBody.fromJson(data);
    print(response.data);
    return phoneResponseBody;
  }

  Future<dynamic> resetBySms(SmsRequest smsRequest, String token) async {
    SmsResponseBody smsResponseBody;

    var formData = FormData.fromMap({
      'data[sms_code]': '${smsRequest.code}',
      //'_token': token,
    });
    print('RESET CODE:' + token);
    print('SMS CODE:' + smsRequest.code);
    var response = await _dio.post(
      '${apiUrl}/arsenal/auth/confirmSms/?_token=$token',
      data: formData,
    );

    var data = response.data;

    smsResponseBody = SmsResponseBody.fromJson(data);
    print(response.data);
    return smsResponseBody;
  }

  Future<dynamic> changePassword(
      String pass, String confirmPass, String token) async {
    ChangePasswordResponseBody changePasswordResponseBody;

    var formData = FormData.fromMap({
      'data[password]': '$pass',
      'data[confirm_password]': '$confirmPass',
      //'_token': '$token'
    });

    var response = await _dio.post(
      '${apiUrl}/arsenal/auth/savePassword/?_token=$token',
      data: formData,
    );

    var data = response.data;
    changePasswordResponseBody = ChangePasswordResponseBody.fromJson(data);
    print(response.data);
    return changePasswordResponseBody;
  }
}
