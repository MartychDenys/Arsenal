import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../application/auth/register/register_by_phone_state_notifier_provider.dart';
import '../../../app/components/friz_text.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/auth/register/register_phone_form_key_provider.dart';
import 'package:flutter/material.dart';


class RegisterPasswordForm extends HookWidget {
  final registerPasswordPhoneFormKey =
      useProvider(registerPasswordPhoneFormKeyProvider);
  final register = useProvider(registerByPhoneStateNotifierProvider);

  final PhoneNumber number = PhoneNumber(isoCode: 'UA');

  final phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerState = useProvider(registerByPhoneStateNotifierProvider.state);


    if (registerState.phone.isNotEmpty) {
      phoneController.text = registerState.phone.substring(3);
    } else {
      phoneController.text = '';
    }

    phoneController.value = phoneController.value.copyWith(
      text: phoneController.text,
      selection: TextSelection(
          baseOffset: phoneController.text.length,
          extentOffset: phoneController.text.length),
    );

    return Form(
      key: registerPasswordPhoneFormKey,
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
                  register.updatePhone(number.phoneNumber.substring(1));
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                selectorTextStyle: TextStyle(color: Colors.black, fontSize: 16),
                ignoreBlank: false,
                initialValue: PhoneNumber(
                  isoCode: 'UA',
                  phoneNumber: phoneController.text.isNotEmpty
                      ? phoneController.text
                      : '',
                ),
                formatInput: true,
                hintText: 'phone_number'.tr(),
                errorMessage: 'phone_number_error'.tr(),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                countries: ['UA']
            ),
          ],
        ),
      ),
    );
  }
}
