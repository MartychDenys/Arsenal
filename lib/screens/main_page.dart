import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/screens/bottom_navigation_page.dart';
import 'package:arsenal_app/widgets/icsurance_card.dart';
import 'package:arsenal_app/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arsenal_app/const/styles-consts.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                UserInfoCard(),
                CallAssistant(context),
                InsuranceCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CallAssistant(context) {
    return Container(
      child: Column(
        children: [
          Divider(
            height: 1,
            color: Color.fromRGBO(227, 227, 229, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NavigationPage(
                              index: 2,
                            )));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              color: red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('call_assistant'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'HelveticaRegular',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: SvgPicture.asset('assets/icons/phone_reverse.svg'),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Color.fromRGBO(227, 227, 229, 1),
          ),
        ],
      ),
    );
  }
}
