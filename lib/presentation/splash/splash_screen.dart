import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final percent = useState(0);

    useEffect(
      () {
        final timer = Timer.periodic(
          const Duration(milliseconds: 15),
          (timer) {
            if (percent.value > 98) {
              timer.cancel();
              Navigator.of(context).pushReplacementNamed('/controller');
            } else {
              percent.value = timer.tick;
            }
          },
        );

        return timer.cancel;
      },
      const [],
    );

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
              'Надійна. Відкрита. СВОЯ!',
              style: TextStyle(
                color: Color.fromRGBO(79, 79, 79, 1),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                fontFamily: 'FrizQuadrataCTT',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
