import 'package:arsenal_app/locale/app_language.dart';
import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/screens/auth_page.dart';
import 'package:arsenal_app/screens/bottom_navigation_page.dart';
import 'package:arsenal_app/screens/come_to_doctor_page.dart';
import 'package:arsenal_app/screens/communication_page.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/policy/conditions_page.dart';
import 'package:arsenal_app/screens/doctor_coupon_page.dart';
import 'package:arsenal_app/screens/history_page.dart';
import 'package:arsenal_app/screens/languages_page.dart';
import 'package:arsenal_app/screens/main_page.dart';
import 'package:arsenal_app/screens/pay_page.dart';
import 'file:///C:/Users/Eugene/arsenal_app/lib/screens/policy/policy_page.dart';
import 'package:arsenal_app/screens/reset_pass_page.dart';
import 'package:arsenal_app/screens/splash/splash_screen.dart';
import 'package:arsenal_app/screens/user_contract_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(ArsenalApp(
    appLanguage: appLanguage,
  ));
}

class ArsenalApp extends StatelessWidget {
  final AppLanguage appLanguage;

  ArsenalApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: AuthPage(),
            initialRoute: '/',
            routes: {
              SplashScreen.routeName: (ctx) => SplashScreen(),
              NavigationPage.routeName: (ctx) => NavigationPage(),
              PolicyPage.routeName: (ctx) => PolicyPage(),
              ConditionsPage.routeName: (ctx) => ConditionsPage(),
              LanguagesPage.routeName: (ctx) => LanguagesPage(),
              ResetPassPage.routeName: (ctx) => ResetPassPage(),
              AuthPage.routeName: (ctx) => AuthPage(),
              UserContractPage.routeName: (ctx) => UserContractPage(),
              DoctorCouponPage.routeName: (ctx) => DoctorCouponPage(),
              ComeToDoctorPage.routeName: (ctx) => ComeToDoctorPage(),
              HistoryPage.routeName: (ctx) => HistoryPage(),
              PayPage.routeName: (ctx) => PayPage(),
              MainPage.routeName: (ctx) => MainPage(),
              CommunicationPage.routeName: (ctx) => CommunicationPage(),
            },
            theme: ThemeData(
              textTheme: TextTheme(
                headline4: TextStyle(
                  //color: Color.fromRGBO(18, 151, 71, 1),
                  fontFamily: 'FrizQuadrataCTT',
                ),
              ),
              primarySwatch: Colors.green,
            ),
            locale: model.appLocal,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: [
              const Locale('uk', 'UA'),
              const Locale('ru', 'RU'),
            ],
          );
        },
      ),
    );
  }
}
