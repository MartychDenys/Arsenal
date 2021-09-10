import '../../../../application/controller/controller_state_provider.dart';
import '../../../../application/controller/index_page_state_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacers.dart';
import '../../../constants/style_constants.dart';
import '../../components/friz_text.dart';
import '../../components/helvetica_text.dart';

class DoctorConfirmDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = useProvider(pageControllerStateProvider);
    final indexPageProvider = useProvider(indexPageStateProvider);

    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(
                12,
              ),
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            SpaceH24(),
            FrizText(
              text: 'recording_message'.tr(),
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: 'congratulation_message'.tr(),
        size: 14,
        color: subtitleColor,
        align: TextAlign.center,
      ),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    },
                    child: HelveticaText(
                      text: 'ask'.tr(),
                      size: 14,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/controller', (r) => false);
                    indexPageProvider.state = 0;
                    _pageController.state.jumpToPage(0);
                  },
                  color: mainColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: HelveticaText(
                      text: 'to_main'.tr(),
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
