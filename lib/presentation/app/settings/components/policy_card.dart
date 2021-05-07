import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/style_constants.dart';
import '../../../policy/conditions_page.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class PolicyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          leading: leadingIcon(),
          title: FrizText(
            text: 'policies'.tr(),
            size: 14,
            color: textColor,
          ),
          subtitle: HelveticaText(
            text: 'manual'.tr(),
            size: 12,
            color: subtitleColor,
          ),
          trailing: ButtonTheme(
            minWidth: 34,
            height: 34,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConditionsPage(),
                  ),
                );
              },
              color: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget leadingIcon() {
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: subtitleColor,
        borderRadius: BorderRadius.circular(
          2.7,
        ),
      ),
      child: SvgPicture.asset('assets/icons/policy_icon.svg'),
    );
  }
}
