import 'package:arsenal_app/locale/app_language.dart';
import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagesPage extends StatelessWidget {
  static const routeName = '/languages';

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              AppLocalizations.of(context).translate('app_lang'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'FrizQuadrataCTT',
                color: Color.fromRGBO(40, 46, 58, 1),
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(40, 46, 58, 1),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context).translate('choose_lang'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'HelveticaRegular',
                      color: Color.fromRGBO(96, 110, 117, 1),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Divider(
                    height: 1,
                    color: Color.fromRGBO(227, 227, 229, 1),
                  ),
                  (model.appLocal.languageCode == 'ru')
                      ? LanguageString('RU', 'Русский', 'ru', true, context)
                      : LanguageString('RU', 'Русский', 'ru', false, context),
                  Divider(
                    height: 1,
                    color: Color.fromRGBO(227, 227, 229, 1),
                  ),
                  (model.appLocal.languageCode == 'uk')
                      ? LanguageString('UA', 'Українська', 'uk', true, context)
                      : LanguageString(
                          'UA', 'Українська', 'uk', false, context),
                  Divider(
                    height: 1,
                    color: Color.fromRGBO(227, 227, 229, 1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget LanguageString(countryCode, countryName, langCode, value, ctx) {
    var appLanguage = Provider.of<AppLanguage>(ctx);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: ClipOval(
            child: Flag(
              '$countryCode',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            '$countryName',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          trailing: CircularCheckBox(
            checkColor: Colors.white,
            activeColor: Color.fromRGBO(18, 151, 71, 1),
            value: value,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onChanged: (bool value) {
              appLanguage.changeLanguage(Locale('$langCode'));
            },
          ),
        ),
      ),
    );
  }
}
