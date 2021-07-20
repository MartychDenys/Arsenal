import 'package:easy_localization/easy_localization.dart';
import '../../../../components/friz_text.dart';
import '../../../../components/helvetica_text.dart';
import '../../../../../constants/spacers.dart';
import '../../../../../constants/style_constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InsurerPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: FrizText(
        text: 'insurer'.tr(),
        size: 18,
      ),
      collapsed: Text(''),
      expanded: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelveticaText(
            text: 'insurance_text_p1'.tr(),
            size: 14,
            color: textColor,
          ),
          SpaceH16(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'legal_address'.tr(),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'legal_address_value'.tr(),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SpaceH16(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'letter_address'.tr(),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'legal_address_value'.tr(),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SpaceH16(),
        ],
      ),
    );
  }
}
