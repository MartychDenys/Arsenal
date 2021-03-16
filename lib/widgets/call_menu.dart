import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/dialogs/telegram_dialog.dart';
import 'package:arsenal_app/widgets/dialogs/viber_dialog.dart';
import 'package:flutter/material.dart';

import 'call_menu_item.dart';

class CallMenu extends StatelessWidget {
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
              messenger: TelegramDialog(),
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
            CallMenuItem(
              title: 'Telegram',
              iconPath: 'assets/icons/telegram.svg',
              messenger: TelegramDialog(),
              //buttonColor: Color.fromRGBO(60, 171, 221, 1),
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
            CallMenuItem(
              title: 'Viber',
              iconPath: 'assets/icons/viber.svg',
              messenger: ViberDialog(),
              //buttonColor: Color.fromRGBO(123, 84, 155, 1),
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
            CallMenuItem(
              title: 'Email',
              iconPath: 'assets/icons/mail.svg',
              messenger: ViberDialog(),
              buttonColor: Color.fromRGBO(18, 151, 71, 1),
            ),
          ],
        ),
      ),
    );
  }
}
