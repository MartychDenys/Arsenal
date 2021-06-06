import '../../../../domain/doctor_coupon/high_temperature_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final highTemperatureStateProvider = StateProvider.autoDispose<HighTemperatureState>(
  (ref) => HighTemperatureState.no,
);
