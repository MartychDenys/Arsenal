import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bottom_navigation/bottom_navigation_page.dart';
import '../../../constants/style_constants.dart';
import '../../components/helvetica_text.dart';

class CallAssistantButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const NavigationPage(
                      index: 2,
                    ),
                  ),
                );
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
