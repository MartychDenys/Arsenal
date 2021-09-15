import '../../../../domain/history/doctor_list.dart';
import '../../../../domain/request_body.dart';
import '../../../../infrastructure/history/history_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doctorHistoryFutureProvider = FutureProvider.autoDispose
    .family<DoctorList, RequestBody>((ref, data) async {
  final history = await HistoryService()
      .getDoctorHistory(data.token, data.id, data.insuranceId);
  return history;
});
