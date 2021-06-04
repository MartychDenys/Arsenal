import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../bottom_navigation/bottom_navigation_page.dart';
import '../../../helpers/navigator_push.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class DoctorDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(
                12,
              ),
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            SpaceH24(),
            FrizText(
              text: 'make_an_appointment_with_a_doctor'.tr(),
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: 'congratulation'.tr(),
        size: 14,
        color: subtitleColor,
        align: TextAlign.center,
      ),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                      // navigatorPushReplacement(
                      //   context,
                      //   const NavigationPage(
                      //     index: 2,
                      //   ),
                      // );
                    },
                    child: HelveticaText(
                      text: 'set_question'.tr(),
                      color: textColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/controller', (r) => false);
                    navigatorPushReplacement(
                      context,
                      const NavigationPage(
                        index: 0,
                      ),
                    );
                  },
                  color: mainColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: HelveticaText(
                      text: 'to_main'.tr(),
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
