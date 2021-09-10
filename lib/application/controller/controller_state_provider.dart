import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/controller/controller_state.dart';

final controllerStateProvider = StateProvider<ControllerState>(
  (ref) => ControllerState.unauthorized,
);

final pageControllerStateProvider = StateProvider<PageController>(
      (ref) => PageController(),
);
