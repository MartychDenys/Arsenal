class DoctorCouponResponseData {
  DoctorCouponResponseData({
    this.status,
    this.message,
  });

  factory DoctorCouponResponseData.fromJson(Map<String, dynamic> json) {
    return DoctorCouponResponseData(
      status: json['status'] as String,
      message: json['message'] as String,
    );
  }

  final String status;
  final String message;
}
