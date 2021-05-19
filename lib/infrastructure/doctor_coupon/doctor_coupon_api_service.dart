import '../../domain/doctor_coupon/doctor_coupon_data.dart';

import '../../domain/doctor_coupon/doctor_coupon_request.dart';
import 'package:dio/dio.dart';

class DoctorCouponApiService {
  final _dio = Dio();
  DoctorCouponData doctorCouponData;

  Future<dynamic> sendRequest(DoctorCouponRequest doctorCouponRequest,
      String token, String userId, String dealId) async {
    const url =
        'https://b24arsenal-strahovanie.s11.itua.in.ua/local/api/dms/appointment/addAppointment/';

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': dealId,
      'data[SYMPTOMS]': '${doctorCouponRequest.symptoms}',
      'data[VISIT_DATE]': '${doctorCouponRequest.visitDate}',
      'data[VISIT_TIME_FROM]': '${doctorCouponRequest.visitTimeFrom}',
      'data[VISIT_TIME_TO]': '${doctorCouponRequest.visitTimeTo}',
      'data[MEDICAL_INSTITUTION]': '${doctorCouponRequest.medicalInstitution}',
      'data[SICK_LIST_REQ]': false,
      'data[COMMENT]': '${doctorCouponRequest.comment}',
    };

    var response = await _dio.post(
      url,
      queryParameters: _query,
    );

    var data = response.data;
    doctorCouponData = DoctorCouponData.fromJson(data);

    return doctorCouponData;
  }
}
