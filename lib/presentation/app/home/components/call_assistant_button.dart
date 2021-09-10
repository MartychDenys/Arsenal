import '../../../../application/controller/controller_state_provider.dart';
import '../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../application/controller/index_page_state_provider.dart';
import '../../../../infrastructure/insurance/insurance_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/style_constants.dart';
import '../../components/helvetica_text.dart';

class CallAssistantButton extends HookWidget {
  CallAssistantButton({this.showNumberNotFoundPopup});

  final Function() showNumberNotFoundPopup;

  @override
  Widget build(BuildContext context) {
    final _pageController = useProvider(pageControllerStateProvider);
    final indexPageProvider = useProvider(indexPageStateProvider);
    final userId = useProvider(currentContactStateNotifierProvider);
    final authData = useProvider(authDataStateNotifierProvider);
    return Container(
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: dividerColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: RaisedButton(
              onPressed: () async {
                final insuranceExpired =
                    await InsuranceService().insuranceExpired(
                  authData.state.data.token,
                  userId.state,
                );

                if (!insuranceExpired) {
                  showNumberNotFoundPopup();
                  return;
                }
                indexPageProvider.state = 2;
                _pageController.state.jumpToPage(2);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              color: errorColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 26,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HelveticaText(
                      text: 'call_assistant'.tr(),
                      size: 14,
                      color: Colors.white,
                      weight: FontWeight.w700,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/phone_reverse.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(227, 227, 229, 1),
          ),
        ],
      ),
    );
  }
}
