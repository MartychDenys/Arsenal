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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetPasswordPhoneFormKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FrizText(
              text: 'phone_number'.tr(),
              size: 18,
              color: textColor,
            ),
            TextFormField(
              cursorColor: mainColor,
              decoration: InputDecoration(
                hintText: 'Номер телефона',
                prefixIcon: Icon(
                  Icons.phone,
                  color: subtitleColor,
                ),
              ),
              keyboardType: TextInputType.phone,
              validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
