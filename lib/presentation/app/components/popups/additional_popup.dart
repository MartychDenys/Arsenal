import '../../communication/components/viber_dialog.dart';
import '../call_menu/call_menu_item.dart';
import '../../../constants/style_constants.dart';
import 'package:flutter/services.dart';
import '../../../constants/spacers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NumberNotFoundPoppup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('phone_not_exist'.tr()),
            const Divider(),
            Text(
              'some_question'.tr()
            ),
            Text(
              'we_always_there'.tr(),
            ),
            SpaceH16(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: '0800604453'));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Text(
                        '0800604453',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
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
                            viberPath: 'https://www.viber.com/httpsarsenal-icua',
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
    this.message,
  }): super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(message),

          ],
        ),
      ),
    );
  }
}