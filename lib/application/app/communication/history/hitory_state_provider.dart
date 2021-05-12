import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../domain/history/hitory_state.dart';

final showHistoryStateProvider = StateProvider.autoDispose<ShowHistoryState>(
  (ref) => ShowHistoryState.invisible,
);
