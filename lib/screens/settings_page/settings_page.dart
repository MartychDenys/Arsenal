import 'package:arsenal_app/locale/app_language.dart';
import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/screens/settings_page/widgets/exit_card.dart';
import 'package:arsenal_app/screens/settings_page/widgets/language_card.dart';
import 'package:arsenal_app/screens/settings_page/widgets/policy_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void didChangeDependencies() async {
    AppLanguage appLanguage = AppLanguage();
    await appLanguage.fetchLocale();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context).translate('settings'),
              style: TextStyle(
                fontFamily: 'FrizQuadrataCTT',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(40, 46, 58, 1),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    LanguageCard(),
                    PolicyCard(),
                    ExitCard(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 11),
                  child: Text(
                    AppLocalizations.of(context).translate('app_version') +
                        ' 0.0.1(beta)',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 110, 117, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'HelveticaRegular',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
