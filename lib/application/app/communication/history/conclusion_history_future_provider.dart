import '../../../../infrastructure/history/history_service.dart';
import '../../../../domain/history/conclusion_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../domain/request_body.dart';

final conclusionHistoryFutureProvider = FutureProvider.autoDispose.family<ConclusionList, RequestBody>((ref, data) async {
  final conclusionHistoryData = await HistoryService().getConclusionHistory(data.token, data.id, data.insuranceId);
  return conclusionHistoryData;
});