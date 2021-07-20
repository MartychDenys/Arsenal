import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

import '../../../../application/auth/register/register_by_sms_state_notifier_provider.dart';
import '../../../../application/auth/register/register_by_sms_form_key_provider.dart';
import '../../../constants/spacers.dart';
import '../../../app/components/friz_text.dart';
import '../../../constants/style_constants.dart';

class RegisterPasswordSmsForm extends HookWidget {
  final registerPasswordSmsFormKey = useProvider(registerPasswordSmsFormKeyProvider);
  final smsCode = useProvider(registerBySmsStateNotifierProvider);

  @override
  Widget build(BuildContext context) {
    String fi = 'a';

    return Form(
      key: registerPasswordSmsFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrizText(
                  text: 'Код з СМС:',
                  size: 18,
                  color: textColor,
                ),
              ],
            ),
            SpaceH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 60,
                    height: 80,
                    child: PinCodeTextField(
                      pinTheme: PinTheme(
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        shape: PinCodeFieldShape.underline,
                        selectedColor: Colors.black,
                        fieldHeight: 50,
                        fieldWidth: 40,
                      ),
                      appContext: context,
                      keyboardType: TextInputType.number,
                      length: 5,
                      onChanged: (String value) => smsCode.updateCode(value),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
