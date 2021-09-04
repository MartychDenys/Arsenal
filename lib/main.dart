import 'package:arsenal_app/presentation/app/communication/components/function_menu/components/doctor_coupon/doctor_coupon_page.dart';

import 'presentation/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/app/communication/components/function_menu/components/paid_yourself/pay_page.dart';
import 'presentation/app/communication/components/history/components/history_page.dart';
import 'presentation/app/settings/components/language/languages_page.dart';
import 'presentation/auth/authentication.dart';
import 'presentation/controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: 'i18n',
      supportedLocales: [
        const Locale('uk', 'UA'),
        const Locale('ru', 'RU'),
        const Locale('en', 'EN'),
      ],
      child: ArsenalApp(),
    ),
  );
}

class ArsenalApp extends StatelessWidget {
  const ArsenalApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          Controller.routeName: (context) => Controller(),
          LanguagesPage.routeName: (ctx) => LanguagesPage(),
          Authentication.routeName: (ctx) => Authentication(),
          HistoryPage.routeName: (ctx) => HistoryPage(),
          PayPage.routeName: (ctx) => PayPage(),
        },
      ),
    );
  }
}
