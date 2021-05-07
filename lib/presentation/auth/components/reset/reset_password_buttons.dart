import '../../../../application/auth/auth_state_provider.dart';
import '../../../../domain/auth/auth_state.dart';
import '../../../app/components/helvetica_text.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'reset_pass_dialog.dart';

class ResetPasswordButtons extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final auth = useProvider(authStateProvider);

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
                  child: HelveticaText(
                    text: 'authorization'.tr(),
                    color: mainColor,
                    size: 14,
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return ResetPassDialog();
                      },
                    );
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
