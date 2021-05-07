import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class TelegramDialog extends StatelessWidget {
  Future<void> _launchTelegram() async {
    if (await canLaunch('https://www.telegram.me/+380509501099')) {
      final bool nativeAppLaunchSucceeded = await launch(
        'https://www.telegram.me/+380509501099',
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch('https://www.telegram.me/+380509501099',
            forceSafariVC: true);
      }
    }
  }

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
                color: telegramColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: SvgPicture.asset(
                telegram,
              ),
            ),
            SpaceH32(),
            FrizText(
              text: 'open_telegram'.tr(),
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: 'chat_telegram'.tr(),
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
                      text: 'cancel'.tr(),
                      size: 14,
                      color: textColor,
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
                  onPressed: _launchTelegram,
                  color: mainColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: HelveticaText(
                      text: 'open'.tr(),
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
