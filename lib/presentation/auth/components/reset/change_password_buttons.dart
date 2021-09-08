import '../../../../application/auth/reset_password/change_password_state_notifier.dart';

import '../../../../application/auth/reset_password/reset_by_sms_form_key_provider.dart';
import '../../../../application/controller/controller_key_provider.dart';
import '../../../helpers/show_message_snack_bar.dart';
import '../../../../application/auth/auth_state_provider.dart';
import '../../../../domain/auth/auth_state.dart';
import '../../../app/components/helvetica_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../infrastructure/reset/reset_service.dart';
import '../../../../application/auth/reset_password/reset_data_state_notifier_provider.dart';

class ChangePasswordButtons extends HookWidget {
  ChangePasswordButtons({
    Key key,
    this.showSystemErrorPopup,
  }): super(key: key);
  final Function(String value) showSystemErrorPopup;
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);
    final resetPasswordFormKey = useProvider(resetPasswordSmsFormKeyProvider);
    final _resetService = ResetService();
    final changePasswordState =
        useProvider(changePasswordStateNotifierProvider.state);
    final controllerKey = useProvider(controllerKeyProvider);
    final token = useProvider(resetDataStateNotifierProvider.state).token;

    void _processResponse(dynamic response) {
      if (response.status == 'success') {
        showSystemErrorPopup('Password successfully changed');
        // showMessageSnackBar(
        //   message: 'Password successfully changed',
        //   scaffoldKey: controllerKey,
        //   color: mainColor,
        // );
        /*showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return ResetPassDialog();
          },
        );*/
        auth.state = AuthState.login;
      } else {
        showSystemErrorPopup('Incorrect data');
        // showMessageSnackBar(
        //   message: 'Incorrect data',
        //   scaffoldKey: controllerKey,
        //   color: errorColor,
        // );
        auth.state = AuthState.changePassword;
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
                    auth.state = AuthState.loading;

                    final response = await _resetService.changePassword(
                        changePasswordState.password,
                        changePasswordState.passwordConfirm,
                        token);

                    _processResponse(response);
                  },
                  color: Color.fromRGBO(18, 151, 71, 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: Text(
                      'confirm'.tr(),
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
