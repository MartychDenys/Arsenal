import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('uk');

  Locale get appLocal => _appLocale ?? Locale("uk");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('uk');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale('ru')) {
      _appLocale = Locale('ru');
      await prefs.setString('language_code', 'ru');
      await prefs.setString('country_code', '');
    } else {
      _appLocale = Locale('uk');
      await prefs.setString('language_code', 'uk');
      await prefs.setString('country_code', 'UA');
    }
    notifyListeners();
  }
}
