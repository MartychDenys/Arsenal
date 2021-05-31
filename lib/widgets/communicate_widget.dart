import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/screens/bottom_navigation_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommunicateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).translate('have_questions'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
              text: AppLocalizations.of(context).translate('contact_us'),
              style: TextStyle(
                color: Color.fromRGBO(18, 151, 71, 1),
                fontFamily: 'HelveticaRegular',
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NavigationPage(
                                index: 2,
                              )));
                },
              children: <InlineSpan>[
                TextSpan(
                  text: AppLocalizations.of(context).translate('contact_us_p2'),
                  style: TextStyle(
                      color: Color.fromRGBO(96, 110, 117, 1),
                      fontFamily: 'HelveticaRegular',
                      fontSize: 13,
                      decoration: TextDecoration.none),
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
