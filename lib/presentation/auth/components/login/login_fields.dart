import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../application/auth/login_form_key_provider.dart';
import '../../../../application/auth/login_state_notifier_provider.dart';
import '../../../app/components/friz_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../../helpers/validators/login/validate_password.dart';
import '../../../../application/auth/login/show_password_provider.dart';
import '../../../../domain/auth/show_password_state.dart';

class LoginFields extends HookWidget {
  PhoneNumber number = PhoneNumber(isoCode: 'UA');
  @override
  Widget build(BuildContext context) {
    final login = useProvider(loginStateNotifierProvider);
    final loginFormKey = useProvider(loginFormKeyProvider);
    final showPassword = useProvider(showPasswordStateProvider);

    return Form(
      key: loginFormKey,
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
            InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  login.updatePhone(number.phoneNumber.substring(1));
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                selectorTextStyle: TextStyle(color: Colors.black, fontSize: 16),
                ignoreBlank: false,
                initialValue: number,
                formatInput: true,
                hintText: 'phone_number'.tr(),
                errorMessage: 'phone_number_error'.tr(),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                countries: ['UA']
            ),
            SpaceH45(),
            FrizText(
              text: 'password'.tr(),
              size: 18,
              color: textColor,
            ),
            TextFormField(
              cursorColor: mainColor,
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
              onChanged: (String value) => login.updatePassword(value),
              validator: validatePassword,
            ),
          ],
        ),
      ),
    );
  }
}
