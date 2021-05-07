import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/controller/controller_state.dart';

final controllerStateProvider = StateProvider<ControllerState>(
  (ref) => ControllerState.unauthorized,
);
