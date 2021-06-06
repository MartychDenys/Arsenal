import '../../domain/doctor_coupon/doctor_coupon_data.dart';

import '../../domain/doctor_coupon/doctor_coupon_request.dart';
import 'package:dio/dio.dart';

import '../constants.dart';

class DoctorCouponApiService {
  final _dio = Dio();
  DoctorCouponData doctorCouponData;

  Future<dynamic> sendRequest(DoctorCouponRequest doctorCouponRequest,
      String token, String userId, String dealId) async {
    const url = '${apiUrl}/dms/appointment/addAppointment/';

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': dealId,
      'data[SYMPTOMS]': '${doctorCouponRequest.symptoms}',
      'data[VISIT_DATE]': '${doctorCouponRequest.visitDate}',
      'data[VISIT_TIME_FROM]': '${doctorCouponRequest.visitTimeFrom}',
      'data[VISIT_TIME_TO]': '${doctorCouponRequest.visitTimeTo}',
      'data[MEDICAL_INSTITUTION]': '${doctorCouponRequest.medicalInstitution}',
      'data[SICK_LIST_REQ]': doctorCouponRequest.medicalList,
      'data[HIGH_TEMPERATURE]': doctorCouponRequest.highTemperature,
      'data[SICK_CONTACT]': doctorCouponRequest.sickContact,
      'data[COMMENT]': '${doctorCouponRequest.comment}',
    };

    print('request: ${_query}');

    var response = await _dio.post(
      url,
      queryParameters: _query,
    );

    var data = response.data;
    print('response: ${data}');
    doctorCouponData = DoctorCouponData.fromJson(data);

    return doctorCouponData;
  }
}
