import 'components/provide_conclusion/provide_conclusion.dart';

import 'components/already_signed/come_to_doctor_page.dart';
import '../../../../helpers/navigator_push.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'components/doctor_coupon/doctor_coupon_page.dart';
import 'components/function_menu_item.dart';

class FunctionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        child: Column(
          children: [
            const Divider(),
            FunctionMenuItem(
              title: 'to_doctor'.tr(),
              buttonFunc: () {
                navigatorPush(
                  context,
                  DoctorCouponPage(),
                );
              },
              buttonTitle: 'appointment_to_doctor'.tr(),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(
                227,
                227,
                229,
                1,
              ),
            ),
            FunctionMenuItem(
              title: 'already_appoint'.tr(),
              buttonFunc: () {
                navigatorPush(
                  context,
                  ComeToDoctorPage(),
                );
              },
              buttonTitle: 'inform'.tr(),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(
                227,
                227,
                229,
                1,
              ),
            ),
            FunctionMenuItem(
              title: 'paid_yourself'.tr(),
              buttonFunc: () {
                Navigator.of(context).pushNamed('/pay');
              },
              buttonTitle: 'reimburse'.tr(),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(
                227,
                227,
                229,
                1,
              ),
            ),
            FunctionMenuItem(
              title: 'doctors_conclusion'.tr(),
              buttonFunc: () {
                navigatorPush(
                  context,
                  ProvideConclusion(),
                );
              },
              buttonTitle: 'provide'.tr(),
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(
                227,
                227,
                229,
                1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
