import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  static const routeName = '/policy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('privacy_policy'),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              policyText(AppLocalizations.of(context).translate('policy_p1')),
              policyText(AppLocalizations.of(context).translate('policy_p2')),
              policyText(AppLocalizations.of(context).translate('policy_p3')),
              policyText(AppLocalizations.of(context).translate('policy_p4')),
              policyText(AppLocalizations.of(context).translate('policy_p5')),
              policyText(AppLocalizations.of(context).translate('policy_p6')),
              policyText(AppLocalizations.of(context).translate('policy_p7'))
            ],
          ),
        ),
      ),
    );
  }

  Widget policyText(text) {
    return Column(
      children: [
        Text(
          '$text',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w400,
            fontFamily: 'HelveticaRegular',
            color: Color.fromRGBO(96, 110, 117, 1),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
