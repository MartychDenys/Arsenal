import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/components/helvetica_text.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/auth/auth_state_provider.dart';
import '../../../../domain/auth/auth_state.dart';


class ResetButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                auth.state = AuthState.reset;
              },
              child: Center(
                child: HelveticaText(
                  text: 'forgot_password'.tr(),
                  color: mainColor,
                  size: 14,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
