import '../../domain/doctor_coupon/doctor_coupon_request.dart';

import 'doctor_coupon_api_service.dart';

class DoctorCouponService {
  final _doctorCouponApiService = DoctorCouponApiService();

  Future<dynamic> sendQuery(
      DoctorCouponRequest doctorCouponRequest, String token, String userId, String dealId) {
    return _doctorCouponApiService.sendRequest(
        doctorCouponRequest, token, userId, dealId);
  }
}
