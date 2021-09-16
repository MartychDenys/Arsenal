import '../../../../application/auth/login/phone_text_editing_controller_provider.dart';

import '../../../../infrastructure/insurance/insurance_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/spacers.dart';
import '../../../app/components/helvetica_text.dart';
import '../../../app/components/main_button.dart';
import '../../../constants/style_constants.dart';
import '../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../application/app/contact/contact_list_state_notifier_provider.dart';
import '../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../application/auth/auth_state_provider.dart';
import '../../../../application/auth/login_form_key_provider.dart';
import '../../../../application/auth/login_state_notifier_provider.dart';
import '../../../../application/controller/controller_key_provider.dart';
import '../../../../application/controller/controller_state_provider.dart';
import '../../../../domain/auth/auth_data.dart';
import '../../../../domain/contact/contact.dart';
import '../../../../domain/auth/auth_state.dart';
import '../../../../domain/controller/controller_state.dart';
import '../../../../infrastructure/auth/auth_service.dart';
import '../../../../infrastructure/contact/contact_service.dart';

class LoginButtons extends HookWidget {
  LoginButtons({
    Key key,
    this.showNumberNotFoundPopup,
    this.showSystemErrorPopup,
  }) : super(key: key);

  final Function() showNumberNotFoundPopup;
  final Function(String error) showSystemErrorPopup;
  final loginFormKey = useProvider(loginFormKeyProvider);

  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);
    final loginFormKey = useProvider(loginFormKeyProvider);
    final _authService = AuthService();
    final _contactService = ContactService();

    final loginStateProvider = useProvider(loginStateNotifierProvider);

    final authData = useProvider(authDataStateNotifierProvider);
    final contactData = useProvider(contactListStateNotifierProvider);
    final userId = useProvider(currentContactStateNotifierProvider);
    final controller = useProvider(controllerStateProvider);

    final phoneTextEditingController =
        useProvider(phoneTextEditingControllerProvider);
    final passwordTextEditingController =
        useProvider(passwordTextEditingControllerProvider);

    void _processResponse(dynamic response) async {
      authData.updateAuthData(response);
      if (response.status == 'success') {
        controller.state = ControllerState.authorized;
        passwordTextEditingController.state.text = '';
      } else {
        showSystemErrorPopup('auth_error'.tr());
        passwordTextEditingController.state.text = '';
        auth.state = AuthState.login;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                auth.state = AuthState.register;
              },
              child: Center(
                child: HelveticaText(
                  text: 'register'.tr(),
                  color: mainColor,
                  size: 14,
                ),
              ),
            ),
          ),
          SpaceH21(),
          Expanded(
            child: MainButton(
              text: 'enter'.tr(),
              onTap: () async {
                loginStateProvider
                    .updatePhone(phoneTextEditingController.state.text);

                if (loginFormKey.currentState.validate()) {
                  auth.state = AuthState.loading;

                  final response = await _authService.login(
                      phoneTextEditingController.state.text,
                      passwordTextEditingController.state.text);

                  passwordTextEditingController.state.text = '';
                  if (response is AuthData) {
                    if (response.status == 'success') {
                      final contactList =
                          await _contactService.getContact(response.data.token);
                      if (contactList is Contact) {
                        contactData.updateContactData(contactList);
                        userId.state = contactList.data.first.id;
                      }
                      _processResponse(response);
                    } else {
                      showSystemErrorPopup('auth_error'.tr());
                      auth.state = AuthState.login;
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
