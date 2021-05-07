import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/components/friz_text.dart';
import '../../app/components/helvetica_text.dart';
import '../../constants/spacers.dart';
import '../../constants/style_constants.dart';

class AuthTitleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            FrizText(
              text: 'user_auth'.tr(),
              size: 18,
              align: TextAlign.center,
            ),
            SpaceH8(),
            HelveticaText(
              text: 'identify_yourself'.tr(),
              color: subtitleColor,
              size: 13,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
