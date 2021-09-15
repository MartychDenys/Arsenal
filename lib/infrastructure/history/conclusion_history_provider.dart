import '../../domain/history/conclusion_list.dart';
import 'package:dio/dio.dart';
import '../constants.dart';

class ConclusionHistoryProvider {
  Future<ConclusionList> getConclusionHistory(String token, String id,
      String insuranceId) async {
    final _dio = Dio();
    ConclusionList conclusionList;

    final url = '${apiUrl}/dms/doctorConclusions/getList/?_token=$token&contactId=$id&dealID=$insuranceId';

    print(url);

    try {
      final response = await _dio.get(url);

      print('RESPONSE $response');

      final responseData = response.data as Map<String, dynamic>;
      print('responseData $responseData');
      conclusionList = ConclusionList.fromJson(responseData);
      print('conclusionList $conclusionList');
    } catch (error) {
      print(error.toString());
    }

    return conclusionList;
  }
}
