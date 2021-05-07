import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/style_constants.dart';
import '../../components/helvetica_text.dart';

class DocumentsAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      color: const Color.fromRGBO(
        245,
        245,
        245,
        1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: SvgPicture.asset(
              alarm,
            ),
          ),
          Expanded(
            child: HelveticaText(
              text: 'how_to_sent'.tr(),
              size: 13,
              color: subtitleColor,
              height: 1.5,
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
