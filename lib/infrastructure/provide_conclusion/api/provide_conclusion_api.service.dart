import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../../domain/provide_conclusion/provide_conclusion_request.dart';

class ProvideConclusionApiService {
  Future<dynamic> sendRequest(ProvideConclusionRequest provideConclusionRequest,
      String token, String userId, String insuranceId) async {
    const url = '${apiUrl}/dms/doctorConclusions/add/';
    final _dio = Dio();
    final bytes = provideConclusionRequest.image.readAsBytesSync();

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[DATE]': provideConclusionRequest.visitDate,
      'data[COMMENT]': '${provideConclusionRequest.comment}',
    };

    Map<String, dynamic> _body = {
      'data[PHOTO]': [provideConclusionRequest.image.uri],
    };

    try {
      final response =
      await _dio.post(
        url,
        data: jsonEncode(_body),
        queryParameters: _query,
      );

      print('response with POST(body) $response');
    } catch (error) {
      print('Error ===> $error');
    }

  }
}
