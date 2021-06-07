import '../../../infrastructure/insurance/insurance_service.dart';

import '../../../domain/insurance/insurance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/request_body.dart';
import 'insurance_id_state_notifier_provider.dart';

final insurancesFutureProvider = FutureProvider.autoDispose
    .family<Insurance, RequestBody>((ref, data) async {
  final insurance = await InsuranceService().getInsurance(data.token, data.id);

  final insuranceProvider = ref.watch(insuranceIdStateNotifierProvider);

  insuranceProvider.updateInsuranceId(insurance.data[0].dealInfo.id);

  return insurance;
});
