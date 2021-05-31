import 'package:arsenal_app/application/auth/reset_password/reset_by_phone_state_notifier_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/components/friz_text.dart';
import '../../../constants/style_constants.dart';
import '../../../helpers/validators/login/validate_phone.dart';
import '../../../../application/auth/reset_password/reset_phone_form_key_provider.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class ResetPasswordForm extends HookWidget {
  final resetPasswordPhoneFormKey =
      useProvider(resetPasswordPhoneFormKeyProvider);
  final login = useProvider(resetByPhoneStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordPhoneFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FrizText(
              text: 'phone_number'.tr(),
              size: 18,
              color: textColor,
            ),
            TextFormField(
              onChanged: (String value) => login.updatePhone(value),
              cursorColor: mainColor,
              initialValue: '380',
              decoration: InputDecoration(
                counterText: '',
                hintText: '380631111111',
                prefixIcon: Icon(
                  Icons.phone,
                  color: subtitleColor,
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 12,
              validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
