import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';
import '../../policy/conditions_page.dart';
import '../../policy/policy_page.dart';

class AuthPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 27,
        right: 27,
        bottom: 22,
      ),
      child: Text.rich(
        TextSpan(
          text: 'accept_policy_p1'.tr(),
          style: const TextStyle(
            fontFamily: 'HelveticaRegular',
            fontSize: 12,
          ),
          children: <InlineSpan>[
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConditionsPage(),
                    ),
                  );
                },
              text: 'accept_policy_p2'.tr(),
              style: const TextStyle(
                color: mainColor,
                fontFamily: 'HelveticaRegular',
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: 'accept_policy_p3'.tr(),
              style: const TextStyle(
                fontFamily: 'HelveticaRegular',
                fontSize: 12,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PolicyPage(),
                    ),
                  );
                },
              text: 'accept_policy_p4'.tr(),
              style: const TextStyle(
                color: mainColor,
                fontFamily: 'HelveticaRegular',
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
