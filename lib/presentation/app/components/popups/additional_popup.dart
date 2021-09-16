import '../../communication/components/viber_dialog.dart';
import '../call_menu/call_menu_item.dart';
import '../../../constants/style_constants.dart';
import '../../../constants/spacers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberNotFoundPoppup extends StatelessWidget {
  Future<void> _makePhoneCall(num) async {
    if (await canLaunch('tel:$num')) {
      await launch('tel://$num');
    } else {
      throw 'Could not launch $num';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(close),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpaceH30(),
            Center(child: Image.asset('assets/images/docs.png')),
            SpaceH30(),

            Container(
              alignment: Alignment.center,
              child: Text(
                'conclusion_xmm'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'conclusion_xmm2'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,),
              ),
            ),

            SpaceH20(),

            Container(
              child: Column(
                children: <Widget>[
                  Text('conclusion_text1'.tr()),
                  Text('conclusion_text2'.tr()),
                  Text('conclusion_text3'.tr()),
                ],
              ),
            ),
            SpaceH30(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CallMenuItem(
                  title: 'call'.tr(),
                  iconPath: viber,
                  onPressButton: () {
                    _makePhoneCall('0800604453');
                    Navigator.of(context).pop();
                  },
                  buttonColor: mainColor,
                ),
                Container(
                  child: CallMenuItem(
                    title: 'Viber',
                    iconPath: viber,
                    onPressButton: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return ViberDialog(
                            viberPath:
                                'viber://pa?chatURI=httpsarsenal-icua'
                          );
                        },
                      );
                    },
                    buttonColor: viberColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowSystemErrorPopup extends StatelessWidget {
  ShowSystemErrorPopup({
    Key key,
    @required this.message,
    this.closePopup
  }) : super(key: key);
  final String message;
  final Function() closePopup;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    closePopup();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(close),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(message),
            SpaceH16(),
            InkWell(
              onTap: () {
                closePopup();
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: mainColor,
                ),
                child: Text(
                  'ok'.tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
