import '../../../components/helvetica_text.dart';

import '../../../components/friz_text.dart';
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
        title: FrizText(
          text: 'app_lang'.tr(),
          size: 18,
          color: textColor,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: textColor,
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
                child: HelveticaText(
                  text: 'choose_lang'.tr(),
                  size: 14,
                  color: subtitleColor,
                  align: TextAlign.center,
                  height: 1.5,
                ),
              ),
              SpaceH32(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Divider(
                  height: 1,
                  color: dividerColor,
                ),
              ),
              if (context.locale.languageCode == 'ru')
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
                  color: dividerColor,
                ),
              ),
              //if (model.appLocal.languageCode == 'uk')
              if (context.locale.languageCode == 'uk')
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
                  color: dividerColor,
                ),
              ),
              if (context.locale.languageCode == 'en')
                const LanguageRow(
                  countryCode: 'GB',
                  countryName: 'English',
                  langCode: 'en',
                  value: true,
                )
              else
                const LanguageRow(
                  countryCode: 'GB',
                  countryName: 'English',
                  langCode: 'en',
                  value: false,
                ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: dividerColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
