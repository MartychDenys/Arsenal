import 'come_to_doctor_response_data.dart';

class ComeToDoctorData {
  ComeToDoctorData({
    this.status,
    this.data,
  });

  factory ComeToDoctorData.fromJson(Map<String, dynamic> json) {
    return ComeToDoctorData(
      status: json['status'] as String,
      data: ComeToDoctorResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final String status;
  final ComeToDoctorResponseData data;
}
