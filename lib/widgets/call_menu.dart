import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/screens/communication_page/widgets/phone_popup.dart';
import 'package:arsenal_app/widgets/dialogs/telegram_dialog.dart';
import 'package:arsenal_app/widgets/dialogs/viber_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'call_menu_item.dart';

class CallMenu extends StatefulWidget {
  @override
  _CallMenuState createState() => _CallMenuState();
}

class _CallMenuState extends State<CallMenu> {
  Future<dynamic> _showPopup() {
    return PhonePopup.popup(context: context);
  }

  Future<void> _launchEmailApp() async {
    if (await canLaunch('mailto:doctor@arsenal-assistans.com?')) {
      await launch('mailto:doctor@arsenal-assistans.com?');
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
        return ViberDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CallMenuItem(
              title: AppLocalizations.of(context).translate('call'),
              iconPath: 'assets/icons/smartphone.svg',
              onPressButton: _showPopup,
              //onPressButton: _makePhoneCall,
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
            CallMenuItem(
              title: 'Telegram',
              iconPath: 'assets/icons/telegram.svg',
              onPressButton: _onTelegramTap,
              buttonColor: Color.fromRGBO(60, 171, 221, 1),
            ),
            CallMenuItem(
              title: 'Viber',
              iconPath: 'assets/icons/viber.svg',
              onPressButton: _onViberTap,
              buttonColor: Color.fromRGBO(123, 84, 155, 1),
            ),
            CallMenuItem(
              title: 'Email',
              iconPath: 'assets/icons/mail.svg',
              onPressButton: _launchEmailApp,
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
          ],
        ),
      ),
    );
  }
}
