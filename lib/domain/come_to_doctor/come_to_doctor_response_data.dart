class ComeToDoctorResponseData {
  ComeToDoctorResponseData({
    this.status,
    this.message,
  });

  factory ComeToDoctorResponseData.fromJson(Map<String, dynamic> json) {
    return ComeToDoctorResponseData(
      status: json['status'] as String,
      message: json['message'] as String,
    );
  }

  final String status;
  final String message;
}
