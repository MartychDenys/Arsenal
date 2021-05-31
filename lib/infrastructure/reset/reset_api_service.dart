import '../../domain/auth/reset/sms_request.dart';
import '../../domain/auth/reset/sms_response_body.dart';

import '../../domain/auth/reset/phone_response_body.dart';
import 'package:dio/dio.dart';
import '../../domain/auth/reset/phone_request.dart';
import '../constants.dart';

class ResetApiService {
  final _dio = Dio();

  Future<dynamic> resetByPhone(PhoneRequest phoneRequest) async {
    PhoneResponseBody phoneResponseBody;

    var formData = FormData.fromMap({
      'data[phone]': '${phoneRequest.phone}',
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
      '_token': token,
    });

    var response = await _dio.post(
      '${apiUrl}/arsenal/auth/confirmSms/',
      data: formData,
    );

    var data = response.data;

    smsResponseBody = SmsResponseBody.fromJson(data);
    print(response.data);
    return smsResponseBody;
  }
}
