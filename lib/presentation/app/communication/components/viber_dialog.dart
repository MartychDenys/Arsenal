import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class ViberDialog extends StatelessWidget {
  const ViberDialog({
    Key key,
    @required this.viberPath,
  }): super(key: key);
  final String viberPath;
  Future<void> _launchViber(String link) async {
    // if (await canLaunch(link)) {
      final bool nativeAppLaunchSucceeded = await launch(
        link,
        forceSafariVC: false,
        universalLinksOnly: false,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(link, forceSafariVC: true);
      }
    // }
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
                color: viberColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: SvgPicture.asset(viber),
            ),
            SpaceH24(),
            FrizText(
              text: 'open_viber'.tr(),
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: 'chat_viber'.tr(),
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
                    //_launchViber('viber://chat?number=380509501099');
                    _launchViber(viberPath);
                  },
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
