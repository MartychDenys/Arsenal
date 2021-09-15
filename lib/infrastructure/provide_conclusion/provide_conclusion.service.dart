import '../../domain/provide_conclusion/provide_conclusion_request.dart';
import 'api/provide_conclusion_api.service.dart';

class ProvideConclusionService {
  final _provideConclusionApiService = ProvideConclusionApiService();

  Future<String> sendQuery(ProvideConclusionRequest provideConclusionRequest,
      String token, String userId, String insuranceId) async {

    return _provideConclusionApiService.sendRequest(
        provideConclusionRequest, token, userId, insuranceId,
    );
  }

  Future<String> sendQuery2(ProvideConclusionRequest provideConclusionRequest,
      String token, String userId, String insuranceId) async {

    return _provideConclusionApiService.sendRequest2(
      provideConclusionRequest, token, userId, insuranceId,
    );
  }
}
