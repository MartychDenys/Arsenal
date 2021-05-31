import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          leading: leadingIcon(),
          title: Text(
            AppLocalizations.of(context).translate('history'),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              fontSize: 14,
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          subtitle: Text(
            AppLocalizations.of(context).translate('check_history'),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'HelveticaRegular',
              color: Color.fromRGBO(96, 110, 117, 1),
            ),
          ),
          trailing: ButtonTheme(
            minWidth: 34,
            height: 34,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/history');
              },
              color: Color.fromRGBO(18, 151, 71, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget leadingIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(96, 110, 117, 1),
        borderRadius: BorderRadius.circular(2.7),
      ),
      child: Icon(
        Icons.history,
        color: Colors.white,
      ),
    );
  }
}
