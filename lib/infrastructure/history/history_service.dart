import '../../domain/history/conclusion_list.dart';
import 'conclusion_history_provider.dart';

import 'history_provider.dart';
import '../../domain/history/confirmed_list.dart';
import '../../domain/history/doctor_list.dart';
import 'doctor_history_provider.dart';

class HistoryService {
  final _historyApiService = HistoryProvider();
  final _doctorHistoryApiService = DoctorHistoryProvider();
  final _conclusionHistory = ConclusionHistoryProvider();

  Future<ConfirmedList> getHistory(
      String token, String id, String insuranceId) async {
    return _historyApiService.getUserHistory(token, id, insuranceId);
  }

  Future<DoctorList> getDoctorHistory(
      String token, String id, String insuranceId) async {
    return _doctorHistoryApiService.getDoctorHistory(token, id, insuranceId);
  }

  Future<ConclusionList> getConclusionHistory(String token, String id, String insuranceId) async {
    return _conclusionHistory.getConclusionHistory(token, id, insuranceId);
  }
}
