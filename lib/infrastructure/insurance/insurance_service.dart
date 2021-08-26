import 'insurance_provider.dart';

import '../../domain/insurance/insurance.dart';
import '../../domain/request_body.dart';

class InsuranceService {
  final _insuranceApiService = InsuranceProvider();

  Future<dynamic> getInsurance(String token, String id) async {
    return _insuranceApiService.getUserInsurance(token, id);
  }
}
