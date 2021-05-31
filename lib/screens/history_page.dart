import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/history';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('history'),
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
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 17),
        alignment: Alignment.topCenter,
        child: Text(
          AppLocalizations.of(context).translate('here_history'),
          style: TextStyle(
            height: 1.5,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: 'HelveticaRegular',
            color: Color.fromRGBO(96, 110, 117, 1),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
