import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AmbulanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate('need_ambulance'),
                  style: TextStyle(
                    fontFamily: 'FrizQuadrataCTT',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color.fromRGBO(235, 87, 87, 1),
                  ),
                ),
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    color: Color.fromRGBO(235, 87, 87, 1),
                    child: Text(
                      AppLocalizations.of(context).translate('communicate'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'HelveticaRegular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  child: SvgPicture.asset('assets/icons/alarm.svg'),
                  padding: EdgeInsets.only(right: 12),
                ),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).translate('alarm'),
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontFamily: 'HelveticaRegular',
                      color: Color.fromRGBO(96, 110, 117, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
