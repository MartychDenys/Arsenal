import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/components/friz_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../../helpers/validators/login/validate_password.dart';
import '../../../../application/auth/register/register_by_sms_state_notifier_provider.dart';
import '../../../../application/auth/register/set_password_form_key.dart';
import '../../../../application/auth/register/set_password_state_notifier.dart';
import '../../../../application/auth/register/show_password_provider.dart';
import '../../../../domain/auth/show_password_state.dart';

class SetPasswordForm extends HookWidget {
  final setPasswordFormKey = useProvider(setPasswordFormKeyProvider);
  final smsCode = useProvider(registerBySmsStateNotifierProvider);
  final setPass = useProvider(setPasswordStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    final showPassword = useProvider(showPasswordStateProvider);

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
              onChanged: (String value) => setPass.updatePassword(value),
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
                  setPass.updatePasswordConfirm(value),
              validator: validatePassword,
              //validator: validatePhone,
            ),
          ],
        ),
      ),
    );
  }
}
