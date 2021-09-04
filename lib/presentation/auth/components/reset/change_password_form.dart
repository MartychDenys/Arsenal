import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/style_constants.dart';
import '../../../constants/spacers.dart';
import '../../../app/components/friz_text.dart';
import '../../../helpers/validators/login/validate_password.dart';
import '../../../../application/auth/reset_password/change_password_form_key.dart';
import '../../../../application/auth/reset_password/change_password_state_notifier.dart';
import '../../../../application/auth/reset_password/reset_by_sms_state_notifier_provider.dart';
import '../../../../application/auth/reset_password/show_password_provider.dart';
import '../../../../domain/auth/show_password_state.dart';
import 'package:easy_localization/easy_localization.dart';
class ChangePasswordForm extends HookWidget {
  final changePasswordFormKey = useProvider(changePasswordFormKeyProvider);
  final smsCode = useProvider(resetBySmsStateNotifierProvider);
  final changePass = useProvider(changePasswordStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    final showPassword = useProvider(showPasswordStateProvider);

    print(showPassword);

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
              initialValue: '',
              obscureText: (showPassword.state == ShowPasswordState.invisible)
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: 'password'.tr(),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (showPassword.state == ShowPasswordState.invisible) {
                      showPassword.state = ShowPasswordState.visible;
                    } else {
                      showPassword.state = ShowPasswordState.invisible;
                    }
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: subtitleColor,
                  ),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    color: subtitleColor,
                  ),
                ),
                /*const Icon(
                  Icons.lock_outline,
                  color: subtitleColor,
                ),*/
              ),
              onChanged: (String value) => changePass.updatePassword(value),
              validator: validatePassword,
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
              initialValue: '',
              obscureText: (showPassword.state == ShowPasswordState.invisible)
                  ? true
                  : false,
              decoration: InputDecoration(
                hintText: 'Пароль',
                suffixIcon: IconButton(
                  onPressed: () {
                    if (showPassword.state == ShowPasswordState.invisible) {
                      showPassword.state = ShowPasswordState.visible;
                    } else {
                      showPassword.state = ShowPasswordState.invisible;
                    }
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: subtitleColor,
                  ),
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    color: subtitleColor,
                  ),
                ),
                /*const Icon(
                  Icons.lock_outline,
                  color: subtitleColor,
                ),*/
              ),
              onChanged: (String value) =>
                  changePass.updatePasswordConfirm(value),
              validator: validatePassword,
              //validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
