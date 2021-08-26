import 'insurance_provider.dart';

import '../../domain/insurance/insurance.dart';
import '../../domain/request_body.dart';

class InsuranceService {
  final _insuranceApiService = InsuranceProvider();

  Future<Insurance> getInsurance(String token, String id) async {
    return _insuranceApiService.getUserInsurance(token, id);
  }

  Future<bool> insuranceExpired(String token, String userId) async {
    return _insuranceApiService.getUserInsuranceExpired(token, userId);
  }
}
