import 'package:dio/dio.dart';
import '../../domain/history/doctor_list.dart';
import '../constants.dart';

class DoctorHistoryProvider {
  Future<DoctorList> getDoctorHistory(
      String token, String id, String insuranceId) async {
    final _dio = Dio();
    DoctorList doctorList;

    final url =
        '${apiUrl}/dms/appointment/appointmentGetList/?_token=$token&contactId=$id&dealID=$insuranceId';
    try {
      final response = await _dio.get(url);

      final responseData = response.data as Map<String, dynamic>;

      doctorList = DoctorList.fromJson(responseData);
      print('');
    } catch (error) {
      print(error.toString());
    }

    return doctorList;
  }
}
