import '../../../presentation/helpers/img_convertor_form_data.dart';
import 'package:dio/dio.dart';
import '../../constants.dart';
import '../../../domain/provide_conclusion/provide_conclusion_request.dart';

class ProvideConclusionApiService {
  Future<String> sendRequest(ProvideConclusionRequest provideConclusionRequest,
      String token, String userId, String insuranceId) async {
    const url = '${apiUrl}/dms/doctorConclusions/add/';
    final _dio = Dio();
    final imgBase64 = await convertToBase64(provideConclusionRequest.image);
    String sendRequestResponse;

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[DATE]': provideConclusionRequest.visitDate,
      'data[COMMENT]': '${provideConclusionRequest.comment}',
    };

    Map<String, dynamic> _body = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[DATE]': provideConclusionRequest.visitDate,
      'data[COMMENT]': '${provideConclusionRequest.comment}',
      'data[PHOTO][]': [imgBase64]
    };

    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    try {
      final response =
      await _dio.post(
        url,
        data: _body,
        queryParameters: _query,
      );

      if (response.data['data']['status'] == 'success') {
        sendRequestResponse = response.data['data']['status'];
      } else {
        sendRequestResponse = 'error';
      }
    } catch (error) {
      print('Error ===> $error');
    }

    return sendRequestResponse;
  }



  Future<String> sendRequest2(ProvideConclusionRequest provideConclusionRequest,
      String token, String userId, String insuranceId) async {
    const url = '${apiUrl}/dms/doctorConclusions/add/';
    final _dio = Dio();
    final imgBase64 = await convertToBase64(provideConclusionRequest.image);
    String sendRequestResponse;

    Map<String, dynamic> _query = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[DATE]': provideConclusionRequest.visitDate,
      'data[COMMENT]': '${provideConclusionRequest.comment}',
    };

    Map<String, dynamic> _body = {
      '_token': token,
      'contactId': userId,
      'dealID': insuranceId,
      'data[DATE]': provideConclusionRequest.visitDate,
      'data[COMMENT]': '${provideConclusionRequest.comment}',
      'data[PHOTO][]': [imgBase64]
    };

    _dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    try {
      final response =
      await _dio.post(
        url,
        data: _body,
        queryParameters: _query,
      );

      if (response.data['data']['status'] == 'success') {
        sendRequestResponse = response.data['data']['status'];
      } else {
        sendRequestResponse = 'error';
      }
    } catch (error) {
      print('Error ===> $error');
    }

    return sendRequestResponse;
  }
}
