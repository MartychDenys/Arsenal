import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/ambulance_card.dart';
import 'package:arsenal_app/widgets/call_menu.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/communication_page/widgets/function_menu.dart';
import 'package:arsenal_app/widgets/history_card.dart';
import 'package:flutter/material.dart';

class CommunicationPage extends StatelessWidget {
  static const routeName = '/communication';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top text widget
                Padding(
                  padding:
                      EdgeInsets.only(left: 46, right: 34, top: 30, bottom: 30),
                  child: Text(
                    AppLocalizations.of(context).translate('call_us'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'HelveticaRegular',
                      color: Color.fromRGBO(96, 110, 117, 1),
                    ),
                  ),
                ),
                CallMenu(),
                FunctionMenu(),
                AmbulanceCard(),
                HistoryCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
