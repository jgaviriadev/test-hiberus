import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String laguageCodeStr = 'languageCode';

//languages code
const String _english = 'en';
const String _spanish = 'es';

const List<String> languageList = [_english, _spanish];

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(laguageCodeStr, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(laguageCodeStr) ?? _english;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case _english:
      return const Locale(_english, '');
    case _spanish:
      return const Locale(_spanish, "");
    default:
      return const Locale(_english, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
