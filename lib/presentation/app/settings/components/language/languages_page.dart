import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants/spacers.dart';
import '../../../../constants/style_constants.dart';
import 'language_row.dart';

class LanguagesPage extends StatelessWidget {
  static const routeName = '/languages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'app_lang'.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
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
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Text(
                  'choose_lang'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'HelveticaRegular',
                    color: subtitleColor,
                  ),
                ),
              ),
              SpaceH32(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Divider(
                  height: 1,
                  color: Color.fromRGBO(227, 227, 229, 1),
                ),
              ),
              //if (model.appLocal.languageCode == 'ru')
                if(context.locale.languageCode == 'ru')
                const LanguageRow(
                  countryCode: 'RU',
                  countryName: 'Русский',
                  langCode: 'ru',
                  value: true,
                )
              else
                const LanguageRow(
                  countryCode: 'RU',
                  countryName: 'Русский',
                  langCode: 'ru',
                  value: false,
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: Color.fromRGBO(227, 227, 229, 1),
                ),
              ),
              //if (model.appLocal.languageCode == 'uk')
              if(context.locale.languageCode == 'uk')
                const LanguageRow(
                  countryCode: 'UA',
                  countryName: 'Українська',
                  langCode: 'uk',
                  value: true,
                )
              else
                const LanguageRow(
                  countryCode: 'UA',
                  countryName: 'Українська',
                  langCode: 'uk',
                  value: false,
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: Color.fromRGBO(227, 227, 229, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
