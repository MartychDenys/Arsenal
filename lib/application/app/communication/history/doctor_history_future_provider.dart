import 'package:arsenal_app/domain/history/doctor_list.dart';
import 'package:arsenal_app/domain/request_body.dart';
import 'package:arsenal_app/infrastructure/history/history_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final doctorHistoryFutureProvider = FutureProvider.autoDispose
    .family<DoctorList, RequestBody>((ref, data) async {
  final history = await HistoryService()
      .getDoctorHistory(data.token, data.id, data.insuranceId);
  return history;
});
