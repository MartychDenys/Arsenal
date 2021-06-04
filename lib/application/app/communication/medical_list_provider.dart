import '../../../domain/doctor_coupon/medical_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final medicalListStateProvider = StateProvider.autoDispose<MedicalListState>(
  (ref) => MedicalListState.unnecessary,
);
