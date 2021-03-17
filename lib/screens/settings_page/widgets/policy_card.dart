import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PolicyCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          leading: leadingIcon(),
          title: Text(
            AppLocalizations.of(context).translate('policies'),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              fontSize: 14,
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          subtitle: Text(
            AppLocalizations.of(context).translate('manual'),
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
                Navigator.of(context).pushNamed('/conditions');
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
      padding: EdgeInsets.all(10),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(96, 110, 117, 1),
        borderRadius: BorderRadius.circular(2.7),
      ),
      child: SvgPicture.asset('assets/icons/policy_icon.svg'),
    );
  }
}
