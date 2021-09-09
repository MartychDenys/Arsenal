import '../../../../application/auth/login/phone_text_editing_controller_provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../application/auth/reset_password/reset_by_phone_state_notifier_provider.dart';
import '../../../app/components/friz_text.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/auth/reset_password/reset_phone_form_key_provider.dart';
import 'package:flutter/material.dart';


class ResetPasswordForm extends HookWidget {

  ResetPasswordForm({
    this.phoneController
  });

  final TextEditingController phoneController;
  final resetPasswordPhoneFormKey =
      useProvider(resetPasswordPhoneFormKeyProvider);
  final reset = useProvider(resetByPhoneStateNotifierProvider);
  final resetState = useProvider(resetByPhoneStateNotifierProvider.state);

  final PhoneNumber number = PhoneNumber(isoCode: 'UA');

  @override
  Widget build(BuildContext context) {
    final phoneTextEditingController = useProvider(phoneTextEditingControllerProvider);

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
            InternationalPhoneNumberInput(
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
              ),
              selectorTextStyle: TextStyle(color: Colors.black, fontSize: 16),
              ignoreBlank: false,
              textFieldController: phoneTextEditingController.state,
              initialValue: PhoneNumber(isoCode: 'UA', phoneNumber: phoneController.text),
              formatInput: true,
              hintText: 'phone_number'.tr(),
              errorMessage: 'phone_number_error'.tr(),
              autoValidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              countries: ['UA'],
              onInputChanged: (PhoneNumber value) {},
            ),
          ],
        ),
      ),
    );
  }
}
