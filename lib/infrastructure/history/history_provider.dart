import 'package:dio/dio.dart';

import '../../domain/history/confirmed_list.dart';
import '../constants.dart';

class HistoryProvider {
  Future<ConfirmedList> getUserHistory(
      String token, String id, String insuranceId) async {
    final _dio = Dio();
    ConfirmedList confirmedList;

    final url =
        '${apiUrl}/dms/appointment/appointmentConfirmationGetList/?_token=$token&contactId=$id&dealID=$insuranceId';
    try {
      final response = await _dio.get(url);

      final responseData = response.data as Map<String, dynamic>;

      confirmedList = ConfirmedList.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    return confirmedList;
  }
}
