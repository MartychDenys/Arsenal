import 'package:dio/dio.dart';
import '../../domain/history/doctor_list.dart';

class DoctorHistoryProvider {
  Future<DoctorList> getDoctorHistory(
      String token, String id, String insuranceId) async {
    final _dio = Dio();
    DoctorList doctorList;

    final url =
        'https://b24arsenal-strahovanie.s11.itua.in.ua/local/api/dms/appointment/appointmentGetList/?_token=$token&contactId=$id&dealID=$insuranceId';
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
