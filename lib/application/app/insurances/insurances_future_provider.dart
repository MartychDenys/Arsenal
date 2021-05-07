import '../../../infrastructure/insurance/insurance_service.dart';

import '../../../domain/insurance/insurance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final insurancesFutureProvider = FutureProvider.autoDispose
    .family<Insurance, String>((ref, String token) async {
  final insurance = await InsuranceService().getInsurance(token);
  return insurance;
});
