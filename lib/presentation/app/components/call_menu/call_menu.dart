import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/style_constants.dart';
import '../../communication/components/phone_popup.dart';
import '../../communication/components/telegram_dialog.dart';
import '../../communication/components/viber_dialog.dart';
import 'call_menu_item.dart';

class CallMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> _showPopup() {
      return PhonePopup.popup(context: context);
    }

    Future<void> _launchEmailApp() async {
      if (await canLaunch('mailto:mobile@arsenal-assistans.com?')) {
        await launch('mailto:mobile@arsenal-assistans.com?');
      } else {
        throw 'Could not launch';
      }
    }

    _onTelegramTap() {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return TelegramDialog();
        },
      );
    }

    _onViberTap() {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return ViberDialog(
            viberPath: 'viber://pa?chatURI=arsenalassistans',
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CallMenuItem(
              title: 'call'.tr(),
              iconPath: phone,
              onPressButton: _showPopup,
              buttonColor: mainColor,
            ),
            CallMenuItem(
              title: 'Telegram',
              iconPath: telegram,
              onPressButton: _onTelegramTap,
              buttonColor: telegramColor,
            ),
            CallMenuItem(
              title: 'Viber',
              iconPath: viber,
              onPressButton: _onViberTap,
              buttonColor: viberColor,
            ),
            CallMenuItem(
              title: 'Email',
              iconPath: mail,
              onPressButton: _launchEmailApp,
              buttonColor: mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
