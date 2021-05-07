import 'doctor_coupon_response_data.dart';

class DoctorCouponData {
  DoctorCouponData({
    this.status,
    this.data,
  });

  factory DoctorCouponData.fromJson(Map<String, dynamic> json) {
    return DoctorCouponData(
      status: json['status'] as String,
      data: DoctorCouponResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final String status;
  final DoctorCouponResponseData data;
}
