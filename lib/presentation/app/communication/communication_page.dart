import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';
import '../components/call_menu/call_menu.dart';
import '../components/helvetica_text.dart';
import 'components/ambulance_card.dart';
import 'components/function_menu/function_menu.dart';
import 'components/history/history_card.dart';

class CommunicationPage extends StatelessWidget {
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
                  padding: const EdgeInsets.only(
                    left: 46,
                    right: 34,
                    top: 30,
                    bottom: 30,
                  ),
                  child: HelveticaText(
                    text: 'call_us'.tr(),
                    size: 14,
                    color: subtitleColor,
                    height: 1.5,
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
