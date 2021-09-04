import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import '../../../../constants/style_constants.dart';
import '../../../components/friz_text.dart';

class LanguageCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Card(
        child: ListTile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: subtitleColor,
              borderRadius: BorderRadius.circular(
                2.7,
              ),
            ),
            child: (context.locale.languageCode == 'uk')
                ? Center(
                    child: Flag(
                      'UA',
                      width: 20,
                      height: 12,
                    ),
                  )
                : (context.locale.languageCode == 'en')
                    ? Center(
                        child: Flag(
                          'gb',
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
          title: FrizText(
            text: 'app_lang'.tr(),
            size: 14,
            color: textColor,
          ),
          subtitle: (context.locale.languageCode == 'uk')
              ? Text(
                  'Вибрано: Українська',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'HelveticaRegular',
                    color: Color.fromRGBO(96, 110, 117, 1),
                  ),
                )
              : (context.locale.languageCode == 'en')
                  ? Text(
                      'Selected: English',
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
  }
}
