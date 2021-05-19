import 'history_provider.dart';
import '../../domain/history/confirmed_list.dart';
import 'package:arsenal_app/domain/history/doctor_list.dart';
import 'package:arsenal_app/infrastructure/history/doctor_history_provider.dart';

class HistoryService {
  final _historyApiService = HistoryProvider();
  final _doctorHistoryApiService = DoctorHistoryProvider();

  Future<ConfirmedList> getHistory(
      String token, String id, String insuranceId) async {
    return _historyApiService.getUserHistory(token, id, insuranceId);
  }

  Future<DoctorList> getDoctorHistory(
      String token, String id, String insuranceId) async {
    return _doctorHistoryApiService.getDoctorHistory(token, id, insuranceId);
  }
}
