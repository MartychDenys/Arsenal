import '../../../../../../../../application/controller/controller_state_provider.dart';
import '../../../../../../../../application/controller/index_page_state_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../constants/spacers.dart';
import '../../../../../../../constants/style_constants.dart';
import '../../../../../../components/friz_text.dart';

class QuestionsWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final indexPageProvider = useProvider(indexPageStateProvider);
    final _pageController = useProvider(pageControllerStateProvider);
    return Container(
      child: Column(
        children: [
          FrizText(
            text: 'have_questions'.tr(),
            size: 18,
            color: textColor,
          ),
          SpaceH10(),
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      indexPageProvider.state = 2;
                      _pageController.state.jumpToPage(2);
                    },
                  text: 'contact_us'.tr(),
                  style: const TextStyle(
                    color: mainColor,
                    fontFamily: 'HelveticaRegular',
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'contact_us_p2'.tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'HelveticaRegular',
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
