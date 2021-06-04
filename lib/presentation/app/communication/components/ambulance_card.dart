import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class AmbulanceCard extends StatelessWidget {
  Future<void> _makePhoneCall(num) async {
    if (await canLaunch('tel:$num')) {
      await launch('tel://$num');
    } else {
      throw 'Could not launch $num';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FrizText(
                  text: 'need_ambulance'.tr(),
                  size: 18,
                  color: errorColor,
                ),
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: () {
                      _makePhoneCall(
                        '0504238999',
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        7.0,
                      ),
                    ),
                    color: errorColor,
                    child: HelveticaText(
                      text: 'communicate'.tr(),
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SpaceH24(),
            Row(
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
                    text: 'alarm'.tr(),
                    height: 1.5,
                    size: 14,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
