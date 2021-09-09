import '../../../../application/auth/login/phone_text_editing_controller_provider.dart';
import '../../../../application/auth/login_state_notifier_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/auth/registration/phone_response_body.dart';
import '../../../../application/auth/register/register_phone_form_key_provider.dart';
import '../../../../application/auth/auth_state_provider.dart';
import '../../../../domain/auth/auth_state.dart';
import '../../../app/components/helvetica_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../../../infrastructure/register/register_service.dart';
import '../../../../application/auth/register/register_data_state_notifier_provider.dart';

class RegisterPasswordButtons extends HookWidget {
  const RegisterPasswordButtons({
    Key key,
    this.showSystemErrorPopup,
  }) : super(key: key);
  final Function(String value) showSystemErrorPopup;

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);
    final resetPasswordFormKey =
        useProvider(registerPasswordPhoneFormKeyProvider);
    final _registerService = RegisterService();
    final registerData = useProvider(registerDataStateNotifierProvider);
    final loginStateProvider = useProvider(loginStateNotifierProvider);

    final phoneTextEditingController =
        useProvider(phoneTextEditingControllerProvider);

    void _processResponse(dynamic response) async {
      if (response.status == 'success') {
        if (response is PhoneResponseBody) {
          // final contactList =
          //     await ContactService().getContact(response.data.token);
          // if (contactList is Contact) {
          //   final insuranceExpired = await InsuranceService().insuranceExpired(
          //     response.data.token,
          //     contactList.data.first.id,
          //   );
          //
          //   if (!insuranceExpired) {
          //     showMessageSnackBar(
          //       message: 'insurance_expired'.tr(),
          //       scaffoldKey: controllerKey,
          //       color: errorColor,
          //     );
          //     auth.state = AuthState.login;
          //     return;
          //   }
          // }

          registerData.updateData(response.data);
          auth.state = AuthState.registerSms;
        } else {
          auth.state = AuthState.login;
        }
      } else {
        showSystemErrorPopup('auth_error'.tr());
        // showMessageSnackBar(
        //   message: 'Incorrect data',
        //   scaffoldKey: controllerKey,
        //   color: errorColor,
        // );
        auth.state = AuthState.register;
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    auth.state = AuthState.login;
                  },
                  child: Center(
                    child: HelveticaText(
                      text: 'authorization'.tr(),
                      color: mainColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () async {
                    loginStateProvider
                        .updatePhone(phoneTextEditingController.state.text);
                    if (resetPasswordFormKey.currentState.validate()) {
                      auth.state = AuthState.loading;

                      final response = await _registerService.registerByPhone(
                          phoneTextEditingController.state.text);
                      _processResponse(response);
                    }
                  },
                  color: Color.fromRGBO(18, 151, 71, 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: Text(
                      'send'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'HelveticaRegular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SpaceH48(),
      ],
    );
  }
}
