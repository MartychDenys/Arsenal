import 'history_provider.dart';
import '../../domain/history/confirmed_list.dart';

class HistoryService {
  final _historyApiService = HistoryProvider();

  Future<ConfirmedList> getHistory(String token) async {
    return _historyApiService.getUserHistory(token);
  }
}
