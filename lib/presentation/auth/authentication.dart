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
import 'components/reset/reset_password_form.dart';
import 'components/reset/reset_password_buttons.dart';
import 'components/reset/reset_password_title.dart';
import 'components/reset/reset_password_sms_form.dart';

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
                    SpaceH105(),
                    LoginButtons(),
                    SpaceH32(),
                  ],
                ),
              ],
              if (auth.state == AuthState.resetSms) ...[
                ResetPasswordTitle(),
                SpaceH16(),
                ResetPasswordForm(),
                SpaceH100(),
                ResetPasswordButtons(),
              ],
              if (auth.state == AuthState.reset) ...[
                ResetPasswordTitle(),
                SpaceH16(),
                ResetPasswordSmsForm(),
                SpaceH100(),
                ResetPasswordButtons(),
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
