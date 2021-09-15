import '../../contact/current_contact_state_notifier_provider.dart';
import '../../insurances/insurance_id_state_notifier_provider.dart';
import '../../../auth/auth_data_state_notifier_provider.dart';
import '../../../../domain/request_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../infrastructure/history/history_service.dart';
import '../../../../domain/history/confirmed_list.dart';

final historyFutureProvider = FutureProvider.autoDispose.family<ConfirmedList, RequestBody>((ref, data) async {
  final insurance = await HistoryService().getHistory(data.token, data.id, data.insuranceId);
  return insurance;
});