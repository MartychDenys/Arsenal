import 'package:dio/dio.dart';

import '../../domain/insurance/insurance.dart';
import '../../domain/history/confirmed_list.dart';

class HistoryProvider {
  Future<ConfirmedList> getUserHistory(String token) async {
    final _dio = Dio();
    ConfirmedList confirmedList;
    print(token);
    final url =
        'https://b24arsenal-strahovanie.s11.itua.in.ua/local/api/dms/appointment/appointmentConfirmationGetList/?_token=$token&contactId=144&dealID=285';
    try {
      final response = await _dio.get(url);
      print(response);
      final responseData = response.data as Map<String, dynamic>;

      confirmedList = ConfirmedList.fromJson(responseData);
    } catch (error) {
      print(error.toString());
    }

    return confirmedList;
  }
}
