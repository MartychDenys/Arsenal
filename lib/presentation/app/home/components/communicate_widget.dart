import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../bottom_navigation/bottom_navigation_page.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';

class CommunicateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FrizText(
            text: 'have_questions'.tr(),
            size: 18,
            color: textColor,
            align: TextAlign.center,
          ),
          SpaceH10(),
          Text.rich(
            TextSpan(
              text: 'contact_us'.tr(),
              style: const TextStyle(
                color: mainColor,
                fontFamily: 'HelveticaRegular',
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const NavigationPage(
                        index: 2,
                      ),
                    ),
                  );
                },
              children: <InlineSpan>[
                TextSpan(
                  text: 'contact_us_p2'.tr(),
                  style: const TextStyle(
                    color: subtitleColor,
                    fontFamily: 'HelveticaRegular',
                    fontSize: 13,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
