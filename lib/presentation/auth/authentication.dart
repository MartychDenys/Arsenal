import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/auth_state_provider.dart';
import '../../domain/auth/auth_state.dart';
import '../constants/spacers.dart';
import '../loader.dart';
import 'components/auth_header_logo.dart';
import 'components/auth_policy.dart';
import 'components/auth_title_row.dart';
import 'components/login/login_buttons.dart';
import 'components/login/login_fields.dart';
import 'components/login/reset_button.dart';
import 'components/reset/reset_password_form.dart';
import 'components/reset/reset_password_buttons.dart';
import 'components/reset/reset_password_title.dart';
import 'components/reset/reset_password_sms_form.dart';
import 'components/reset/reset_by_sms_buttons.dart';
import 'components/reset/change_password_title.dart';
import 'components/reset/change_password_buttons.dart';
import 'components/reset/change_password_form.dart';
import 'components/registration/register_password_form.dart';
import 'components/registration/register_password_buttons.dart';
import 'components/registration/register_password_title.dart';
import 'components/registration/register_password_sms_form.dart';
import 'components/registration/register_by_sms_buttons.dart';
import 'components/registration/set_password_title.dart';
import 'components/registration/set_password_buttons.dart';
import 'components/registration/set_password_form.dart';

class Authentication extends HookWidget {
  static const routeName = '/auth';

  final auth = useProvider(authStateProvider);

  @override
  Widget build(BuildContext context) {
    if (auth.state != AuthState.loading) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AuthHeaderLogo(),
              if (auth.state == AuthState.login) ...[
                Column(
                  children: [
                    AuthTitleRow(),
                    SpaceH16(),
                    LoginFields(),
                    SpaceH80(),
                    LoginButtons(),
                    SpaceH32(),
                    ResetButton(),
                    SpaceH32(),
                  ],
                ),
              ],
              if (auth.state == AuthState.reset) ...[
                ResetPasswordTitle(),
                SpaceH16(),
                ResetPasswordForm(),
                SpaceH100(),
                ResetPasswordButtons(),
              ],
              if (auth.state == AuthState.resetSms) ...[
                ResetPasswordTitle(),
                SpaceH16(),
                ResetPasswordSmsForm(),
                SpaceH100(),
                ResetBySmsPasswordButtons(),
              ],
              if (auth.state == AuthState.changePassword) ...[
                ChangePasswordTitle(),
                ChangePasswordForm(),
                SpaceH100(),
                ChangePasswordButtons(),
              ],
              if (auth.state == AuthState.register) ...[
                RegisterPasswordTitle(),
                SpaceH16(),
                RegisterPasswordForm(),
                SpaceH100(),
                RegisterPasswordButtons(),
              ],
              if (auth.state == AuthState.registerSms) ...[
                RegisterPasswordTitle(),
                SpaceH16(),
                RegisterPasswordSmsForm(),
                SpaceH100(),
                RegisterBySmsPasswordButtons(),
              ],
              if (auth.state == AuthState.setPassword) ...[
                SetPasswordTitle(),
                SetPasswordForm(),
                SpaceH100(),
                SetPasswordButtons(),
              ],
              AuthPolicy(),
            ],
          ),
        ),
      );
    } else {
      return Loader();
    }
  }
}