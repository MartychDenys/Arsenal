import '../../../../domain/come_to_doctor/sick_contact_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sickContactStateProvider = StateProvider.autoDispose<SickContactState>(
  (ref) => SickContactState.no,
);
