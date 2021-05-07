import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../constants/style_constants.dart';
import '../../../../components/app_bar_with_back_button.dart';
import '../../../../components/helvetica_text.dart';

class HistoryPage extends HookWidget {
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'history'.tr(),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(
          top: 17,
        ),
        alignment: Alignment.topCenter,
        child: HelveticaText(
          text: 'here_history'.tr(),
          size: 13,
          color: subtitleColor,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
