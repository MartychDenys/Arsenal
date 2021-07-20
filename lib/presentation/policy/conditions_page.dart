import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'components/policy_frame.dart';
import 'components/policy_text.dart';

class ConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PolicyFrame(
      title: 'policies'.tr(),
      child: [
        PolicyText(
          title: 'policy_p1'.tr(),
        ),
        PolicyText(
          title: 'policy_p2'.tr(),
        ),
        PolicyText(
          title: 'policy_p3'.tr(),
        ),
        PolicyText(
          title: 'policy_p4'.tr(),
        ),
        PolicyText(
          title: 'policy_p5'.tr(),
        ),
        PolicyText(
          title: 'policy_p6'.tr(),
        ),
        PolicyText(
          title: 'policy_p7'.tr(),
        ),
      ],
    );
  }
}
