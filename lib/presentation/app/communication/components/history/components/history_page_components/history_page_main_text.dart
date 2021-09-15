import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class HistoryPageMainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.only(
       top: 17,
       left: 40,
       right: 40,
       bottom: 30,
     ),
     alignment: Alignment.topCenter,
     child: HelveticaText(
       text: 'here_history'.tr(),
       size: 13,
       color: subtitleColor,
       align: TextAlign.center,
     ),
   );
  }
}