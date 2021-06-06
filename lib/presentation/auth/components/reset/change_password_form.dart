import '../../../../application/auth/reset_password/reset_by_sms_state_notifier_provider.dart';

import '../../../../application/auth/reset_password/change_password_form_key.dart';
import '../../../constants/spacers.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/components/friz_text.dart';
import '../../../constants/style_constants.dart';
import 'package:flutter/material.dart';
import '../../../../application/auth/reset_password/change_password_state_notifier.dart';

class ChangePasswordForm extends HookWidget {
  final changePasswordFormKey = useProvider(changePasswordFormKeyProvider);
  final smsCode = useProvider(resetBySmsStateNotifierProvider);
  final changePass = useProvider(changePasswordStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordFormKey,
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
              onChanged: (String value) => changePass.updatePassword(value),
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
                  changePass.updatePasswordConfirm(value),
              //validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
