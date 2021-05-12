import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../infrastructure/history/history_service.dart';
import '../../../../domain/history/confirmed_list.dart';

final historyFutureProvider = FutureProvider.autoDispose
    .family<ConfirmedList, String>((ref, String token) async {
  final insurance = await HistoryService().getHistory(token);
  return insurance;
});
