import '../../../../application/controller/controller_state_provider.dart';
import '../../../../application/controller/index_page_state_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../bottom_navigation/bottom_navigation_page.dart';
import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';

class CommunicateWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = useProvider(pageControllerStateProvider);
    final indexPageProvider = useProvider(indexPageStateProvider);

    return Container(
      child: Column(
        children: [
          FrizText(
            text: 'have_questions'.tr(),
            size: 18,
            color: textColor,
            align: TextAlign.center,
          ),
          SpaceH10(),
          Text.rich(
            TextSpan(
              text: 'contact_us'.tr(),
              style: const TextStyle(
                color: mainColor,
                fontFamily: 'HelveticaRegular',
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  indexPageProvider.state = 2;
                  _pageController.state.jumpToPage(2);
                },
              children: <InlineSpan>[
                TextSpan(
                  text: 'contact_us_p2'.tr(),
                  style: const TextStyle(
                    color: subtitleColor,
                    fontFamily: 'HelveticaRegular',
                    fontSize: 13,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
