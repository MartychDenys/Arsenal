import 'come_to_doctor_api_service.dart';
import '../../domain/come_to_doctor/come_to_doctor_request.dart';

class ComeToDoctorService {
  final _comeToDoctorApiService = ComeToDoctorApiService();

  Future<dynamic> sendQuery(ComeToDoctorRequest doctorCouponRequest,
      String token, String userId, String insuranceId) {
    return _comeToDoctorApiService.sendRequest(
        doctorCouponRequest, token, userId, insuranceId);
  }
}
