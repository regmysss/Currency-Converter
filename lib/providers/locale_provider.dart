import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("en");
  Locale get locale => _locale;


  LocaleProvider(Locale locale){
    _locale = locale;
  }

  void setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    if(!AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }
    _locale = locale;

    prefs.setString('lang', locale.toString());

    notifyListeners();
  }
}