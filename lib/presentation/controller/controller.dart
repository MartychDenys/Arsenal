import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/controller/controller_key_provider.dart';
import '../../application/controller/controller_state_provider.dart';
import '../../domain/controller/controller_state.dart';
import '../auth/authentication.dart';
import '../bottom_navigation/bottom_navigation_page.dart';

class Controller extends HookWidget {
  static const routeName = '/controller';

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(controllerStateProvider);
    final controllerKey = useProvider(controllerKeyProvider);

    return Scaffold(
      key: controllerKey,
      backgroundColor: Colors.white,
      body: (controller.state == ControllerState.unauthorized)
          ? Authentication()
          : NavigationPage(),
    );
  }
}
