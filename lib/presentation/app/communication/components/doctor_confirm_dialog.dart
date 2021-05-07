import '../../../bottom_navigation/bottom_navigation_page.dart';
import '../../../helpers/navigator_push.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class DoctorConfirmDialog extends StatelessWidget {
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
              text: 'recording_message'.tr(),
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: 'congratulation_message'.tr(),
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
                      Navigator.of(context).pop();
                    },
                    child: HelveticaText(
                      text: 'ask'.tr(),
                      size: 14,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    navigatorPush(
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
                      size: 14,
                      color: Colors.white,
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
