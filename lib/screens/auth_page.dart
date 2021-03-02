import 'dart:ui';

import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildLogoHeader(width),
            buildTitle(context),
            SizedBox(
              height: 32,
            ),
            buildAuthForm(context),
            SizedBox(
              height: 20,
            ),
            buildPolicy(context),
          ],
        ),
      ),
    );
  }

  Widget buildLogoHeader(width) {
    return Container(
      height: 283,
      child: Stack(
        children: [
          Container(
            height: 203,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/auth/background.png'),
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(18, 151, 71, 0.1), BlendMode.color),
              ),
            ),
          ),
          /*Image(
            height: 203,
            width: double.infinity,
            image: AssetImage('assets/auth/background.png'),
          ),*/
          Align(
            alignment: Alignment.center,
            child: Image(
              width: 148,
              height: 148,
              image: AssetImage('assets/auth/logo.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(ctx) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(ctx).translate('user_auth'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            AppLocalizations.of(context).translate('identify_yourself'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(96, 110, 117, 1),
              fontWeight: FontWeight.w400,
              fontFamily: 'HelveticaRegular',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAuthForm(ctx) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('phone_number'),
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(40, 46, 58, 1),
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
            ),
          ),
          TextFormField(
            initialValue: '+ 38 (068) 251 25 11',
            cursorColor: Color.fromRGBO(18, 151, 71, 1),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                color: Color.fromRGBO(96, 110, 117, 1),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            AppLocalizations.of(context).translate('password'),
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(40, 46, 58, 1),
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
            ),
          ),
          TextFormField(
            initialValue: 'je9q12_23',
            cursorColor: Color.fromRGBO(18, 151, 71, 1),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Color.fromRGBO(96, 110, 117, 1),
                ),
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Color.fromRGBO(96, 110, 117, 1),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 105,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(ctx).pushReplacementNamed('/reset_password');
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('forgot_password'),
                      style: TextStyle(
                        color: Color.fromRGBO(18, 151, 71, 1),
                        fontFamily: 'HelveticaRegular',
                        fontSize: 14,
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
                      Navigator.of(ctx).pushReplacementNamed('/navigation');
                    },
                    color: Color.fromRGBO(18, 151, 71, 1),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      child: Text(
                        AppLocalizations.of(context).translate('enter'),
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
          ),
        ],
      ),
    );
  }

  Widget buildPolicy(ctx) {
    return Container(
      padding: EdgeInsets.only(left: 27, right: 27, bottom: 22),
      child: Text.rich(
        TextSpan(
          text: AppLocalizations.of(context).translate('accept_policy_p1'),
          style: TextStyle(
            fontFamily: 'HelveticaRegular',
            fontSize: 12,
          ),
          children: <InlineSpan>[
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(ctx).pushNamed('/conditions');
                },
              text: AppLocalizations.of(context).translate('accept_policy_p2'),
              style: TextStyle(
                color: Color.fromRGBO(18, 151, 71, 1),
                fontFamily: 'HelveticaRegular',
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context).translate('accept_policy_p3'),
              style: TextStyle(fontFamily: 'HelveticaRegular', fontSize: 12),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(ctx).pushNamed('/policy');
                },
              text: AppLocalizations.of(context).translate('accept_policy_p4'),
              style: TextStyle(
                color: Color.fromRGBO(18, 151, 71, 1),
                fontFamily: 'HelveticaRegular',
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
