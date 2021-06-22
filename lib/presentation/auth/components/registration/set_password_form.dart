import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../app/components/friz_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/auth/register/register_by_sms_state_notifier_provider.dart';
import '../../../../application/auth/register/set_password_form_key.dart';
import '../../../../application/auth/register/set_password_state_notifier.dart';

class SetPasswordForm extends HookWidget {
  final setPasswordFormKey = useProvider(setPasswordFormKeyProvider);
  final smsCode = useProvider(registerBySmsStateNotifierProvider);
  final setPass = useProvider(setPasswordStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: setPasswordFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FrizText(
              text: 'Новий пароль',
              size: 18,
              color: textColor,
            ),
            SpaceH20(),
            TextFormField(
              cursorColor: subtitleColor,
              decoration: const InputDecoration(
                counterText: '',
              ),
              onChanged: (String value) => setPass.updatePassword(value),
              //validator: validatePhone,
            ),
            SpaceH20(),
            FrizText(
              text: 'Підтвердіть новий пароль',
              size: 18,
              color: textColor,
            ),
            SpaceH20(),
            TextFormField(
              cursorColor: subtitleColor,
              decoration: const InputDecoration(
                counterText: '',
              ),
              onChanged: (String value) =>
                  setPass.updatePasswordConfirm(value),
              //validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
