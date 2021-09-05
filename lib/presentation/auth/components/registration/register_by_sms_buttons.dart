import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/components/helvetica_text.dart';
import '../../../constants/spacers.dart';
import '../../../helpers/show_message_snack_bar.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/auth/auth_state_provider.dart';
import '../../../../application/auth/register/register_by_sms_form_key_provider.dart';
import '../../../../application/auth/register/register_by_sms_state_notifier_provider.dart';
import '../../../../application/auth/register/register_data_state_notifier_provider.dart';
import '../../../../application/controller/controller_key_provider.dart';
import '../../../../infrastructure/register/register_service.dart';
import '../../../../domain/auth/auth_state.dart';

class RegisterBySmsPasswordButtons extends HookWidget {
  const RegisterBySmsPasswordButtons({
    Key key,
    this.showSystemErrorPopup,
  }): super(key: key);
  final Function(String value) showSystemErrorPopup;
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);
    final registerPasswordFormKey = useProvider(registerPasswordSmsFormKeyProvider);
    final _registerService = RegisterService();
    final registerState = useProvider(registerBySmsStateNotifierProvider.state);
    final controllerKey = useProvider(controllerKeyProvider);
    final token = useProvider(registerDataStateNotifierProvider.state).token;

    void _processResponse(dynamic response) {
      if (response.status == 'success') {
        auth.state = AuthState.setPassword;
      } else {
        showSystemErrorPopup('Incorrect data');
        // showMessageSnackBar(
        //   message: 'Incorrect data',
        //   scaffoldKey: controllerKey,
        //   color: errorColor,
        // );
        auth.state = AuthState.registerSms;
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
                    if (registerPasswordFormKey.currentState.validate()) {
                      auth.state = AuthState.loading;

                      final response =
                          await _registerService.registerBySms(registerState, token);

                      _processResponse(response);
                    }
                    /*showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return ResetPassDialog();
                      },
                    );*/
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
