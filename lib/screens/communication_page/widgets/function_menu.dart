import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../widgets/function_menu_item.dart';

class FunctionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: Column(
          children: [
            Divider(),
            FunctionMenuItem(
              title: AppLocalizations.of(context).translate('to_doctor'),
              buttonFunc: () {
                Navigator.of(context).pushNamed('/doctorCoupon');
              },
              buttonTitle: AppLocalizations.of(context)
                  .translate('appointment_to_doctor'),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(227, 227, 229, 1),
            ),
            FunctionMenuItem(
              title: AppLocalizations.of(context).translate('already_appoint'),
              buttonFunc: () {
                Navigator.of(context).pushNamed('/visitDoctor');
              },
              buttonTitle: AppLocalizations.of(context).translate('inform'),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(227, 227, 229, 1),
            ),
            FunctionMenuItem(
              title: AppLocalizations.of(context).translate('paid_yourself'),
              buttonFunc: () {
                Navigator.of(context).pushNamed('/pay');
              },
              buttonTitle: AppLocalizations.of(context).translate('reimburse'),
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(227, 227, 229, 1),
            ),
          ],
        ),
      ),
    );
  }
}
