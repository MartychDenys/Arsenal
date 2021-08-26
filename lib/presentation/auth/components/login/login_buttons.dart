import '../../../../infrastructure/insurance/insurance_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/spacers.dart';
import '../../../app/components/helvetica_text.dart';
import '../../../app/components/main_button.dart';
import '../../../constants/style_constants.dart';
import '../../../helpers/show_message_snack_bar.dart';
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
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);
    final loginFormKey = useProvider(loginFormKeyProvider);
    final _authService = AuthService();
    final _contactService = ContactService();
    final loginState = useProvider(loginStateNotifierProvider.state);
    final authData = useProvider(authDataStateNotifierProvider);
    final contactData = useProvider(contactListStateNotifierProvider);
    final userId = useProvider(currentContactStateNotifierProvider);
    final controller = useProvider(controllerStateProvider);
    final controllerKey = useProvider(controllerKeyProvider);

    void _processResponse(dynamic response) async {
      authData.updateAuthData(response);
      print(response.status);
      if (response.status == 'success') {
        print(response.data.token);
        controller.state = ControllerState.authorized;
      } else {
        showMessageSnackBar(
          message: 'auth_error'.tr(),
          scaffoldKey: controllerKey,
          color: errorColor,
        );
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
                if (loginFormKey.currentState.validate()) {
                  auth.state = AuthState.loading;

                  final response = await _authService.login(loginState);
                  if (response is AuthData) {
                    if (response.status == 'success') {
                      final contactList =
                          await _contactService.getContact(response.data.token);
                      if (contactList is Contact) {
                        contactData.updateContactData(contactList);
                        userId.state = contactList.data.first.id;

                        final insuranceExpired = await InsuranceService().insuranceExpired(response.data.token, userId.state);

                        if (!insuranceExpired) {
                          showMessageSnackBar(
                            message: 'insurance_expired'.tr(),
                            scaffoldKey: controllerKey,
                            color: errorColor,
                          );
                          auth.state = AuthState.login;
                          return;
                        }
                        print('USER ID ${userId.state}');
                        print('USER TOKEN ${response.data.token}');
                      }
                      _processResponse(response);
                    } else {
                      showMessageSnackBar(
                        message: 'auth_error'.tr(),
                        scaffoldKey: controllerKey,
                        color: errorColor,
                      );
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
