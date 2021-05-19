import '../../../infrastructure/insurance/insurance_service.dart';

import '../../../domain/insurance/insurance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/request_body.dart';

final insurancesFutureProvider = FutureProvider.autoDispose
    .family<Insurance, RequestBody>((ref, data) async {
  final insurance = await InsuranceService().getInsurance(data.token, data.id);
  return insurance;
});
