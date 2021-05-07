import 'package:arsenal_app/locale/app_language.dart';
import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Card(
          child: ListTile(
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Color.fromRGBO(96, 110, 117, 1),
                borderRadius: BorderRadius.circular(2.7),
              ),
              child: (model.appLocal.languageCode == 'uk')
                  ? Center(
                      child: Flag(
                        'UA',
                        width: 20,
                        height: 12,
                      ),
                    )
                  : Center(
                      child: Flag(
                        'RU',
                        width: 20,
                        height: 12,
                      ),
                    ),
            ),
            title: Text(
              AppLocalizations.of(context).translate('app_lang'),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'FrizQuadrataCTT',
                fontSize: 14,
                color: Color.fromRGBO(40, 46, 58, 1),
              ),
            ),
            subtitle: (model.appLocal.languageCode == 'uk')
                ? Text(
                    'Вибрано: Українська',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'HelveticaRegular',
                      color: Color.fromRGBO(96, 110, 117, 1),
                    ),
                  )
                : Text(
                    'Выбрано: Русский',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'HelveticaRegular',
                      color: Color.fromRGBO(96, 110, 117, 1),
                    ),
                  ),
            trailing: ButtonTheme(
              minWidth: 34,
              height: 34,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/languages');
                },
                color: Color.fromRGBO(18, 151, 71, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
