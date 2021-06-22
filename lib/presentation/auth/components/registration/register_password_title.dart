import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacers.dart';

class RegisterPasswordTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              'register'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'FrizQuadrataCTT',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'register_condition'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(96, 110, 117, 1),
                fontWeight: FontWeight.w400,
                fontFamily: 'HelveticaRegular',
              ),
            ),
            SpaceH8(),
          ],
        ),
      ),
    );
  }
}
