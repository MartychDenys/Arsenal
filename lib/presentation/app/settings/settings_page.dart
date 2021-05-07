import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/style_constants.dart';
import 'components/exit/exit_card.dart';
import 'components/language/language_card.dart';
import 'components/policy_card.dart';

class SettingsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'settings'.tr(),
          style: const TextStyle(
            fontFamily: 'FrizQuadrataCTT',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textColor,
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
              padding: const EdgeInsets.only(
                bottom: 11,
              ),
              child: Text(
                'app_version'.tr() + ' 0.0.1(beta)',
                style: const TextStyle(
                  color: subtitleColor,
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
  }
}
