import 'package:arsenal_app/domain/request_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../infrastructure/history/history_service.dart';
import '../../../../domain/history/confirmed_list.dart';

final historyFutureProvider = FutureProvider.autoDispose
    .family<ConfirmedList, RequestBody>((ref, data) async {
  final insurance =
      await HistoryService().getHistory(data.token, data.id, data.insuranceId);
  return insurance;
});
