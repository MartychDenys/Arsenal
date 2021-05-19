import 'package:hooks_riverpod/hooks_riverpod.dart';

final insuranceIdStateNotifierProvider =
    StateNotifierProvider.autoDispose<InsuranceIdStateNotifier>(
  (ref) => InsuranceIdStateNotifier(),
);

class InsuranceIdStateNotifier extends StateNotifier<String> {
  InsuranceIdStateNotifier() : super(null);

  void updateInsuranceId(String currentId) {
    state = currentId;
  }
}
