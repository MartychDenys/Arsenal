import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';

class DoctorConfirmDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 151, 71, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              AppLocalizations.of(context).translate('recording_message'),
              style: TextStyle(
                fontFamily: 'FrizQuadrataCTT',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      content: Text(
        AppLocalizations.of(context).translate('congratulation_message'),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'HelveticaRegular',
          color: Color.fromRGBO(96, 110, 117, 1),
        ),
        textAlign: TextAlign.center,
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
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('ask'),
                      style: TextStyle(
                        color: Color.fromRGBO(40, 46, 58, 1),
                        fontFamily: 'HelveticaRegular',
                        fontSize: 14,
                      ),
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
                    Navigator.of(context).pushReplacementNamed('/navigation');
                  },
                  color: Color.fromRGBO(18, 151, 71, 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Text(
                      AppLocalizations.of(context).translate('to_main'),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'HelveticaRegular',
                        fontSize: 14,
                      ),
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
