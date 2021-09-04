import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int percent = 0;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/auth');
  }

  @override
  void initState() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 20), (_) {
      setState(() {
        percent += 1;
        if (percent >= 99) {
          timer.cancel();
          navigationPage();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash/splash_logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'reliable_open_own'.tr(),
              style: TextStyle(
                  color: Color.fromRGBO(79, 79, 79, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  fontFamily: 'FrizQuadrataCTT'),
            ),
          ],
        ),
      ),
    );
  }
}
