import '../../domain/come_to_doctor/come_to_doctor_request.dart';
import 'package:dio/dio.dart';
import '../../domain/come_to_doctor/come_to_doctor_data.dart';
import '../constants.dart';

class ComeToDoctorApiService {
  final _dio = Dio();
  ComeToDoctorData comeToDoctorData;

  Future<dynamic> sendRequest(ComeToDoctorRequest comeToDoctorRequest,
      String token, String userId, String insuranceId) async {
    const url = '${apiUrl}/dms/appointment/addAppointmentConfirmation/';

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[SYMPTOMS]': '${comeToDoctorRequest.symptoms}',
      'data[VISIT_DATE]': '${comeToDoctorRequest.visitDate}',
      'data[VISIT_TIME]': '${comeToDoctorRequest.visitTime}',
      'data[MEDICAL_INSTITUTION]': '${comeToDoctorRequest.medicalInstitution}',
      'data[DOCTOR_FIO]': '${comeToDoctorRequest.doctorName}',
      'data[SICK_LIST_REQ]': comeToDoctorRequest.medicalList,
      'data[HIGH_TEMPERATURE]': comeToDoctorRequest.highTemperature,
      'data[SICK_CONTACT]': comeToDoctorRequest.sickContact,
      'data[COMMENT]': '${comeToDoctorRequest.comment}',
    };

    var response = await _dio.post(
      url,
      queryParameters: _query,
    );

    var data = response.data;
    comeToDoctorData = ComeToDoctorData.fromJson(data);

    return comeToDoctorData;
  }
}
