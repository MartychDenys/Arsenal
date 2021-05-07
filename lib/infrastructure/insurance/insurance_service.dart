import 'insurance_provider.dart';

import '../../domain/insurance/insurance.dart';

class InsuranceService {
  final _insuranceApiService = InsuranceProvider();

  Future<Insurance> getInsurance(String token) async {
    return _insuranceApiService.getUserInsurance(token);
  }
}
