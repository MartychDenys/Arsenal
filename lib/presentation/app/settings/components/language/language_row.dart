// import 'package:circular_check_box/circular_check_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import '../../../../constants/style_constants.dart';
import '../../../components/friz_text.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({
    Key key,
    @required this.countryCode,
    @required this.countryName,
    @required this.langCode,
    @required this.value,
  }) : super(key: key);

  final String countryCode;
  final String countryName;
  final String langCode;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (langCode == 'en' || langCode == 'gb') {
              EasyLocalization.of(context).setLocale(
                Locale('en', 'EN'),
              );
              return;
            }
            EasyLocalization.of(context).setLocale(
              Locale(langCode, countryCode),
            );
          },
          child: Container(
            child: ListTile(
              title: Text(
                countryName,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              leading: ClipOval(
                child: Flag(
                  countryCode,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
