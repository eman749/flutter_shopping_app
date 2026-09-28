import 'package:flutter/material.dart';

/// Global locale manager allowing dynamic language switching between Arabic and English.
class LocaleNotifier extends ChangeNotifier {
  Locale _locale = const Locale('ar'); // Default to Arabic as highlighted in bonus/localization specs

  Locale get locale => _locale;

  bool get isArabic => _locale.languageCode == 'ar';

  void setLocale(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }

  void toggleLocale() {
    if (_locale.languageCode == 'ar') {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('ar');
    }
    notifyListeners();
  }
}

/// Global instance for easy access across widgets
final localeNotifier = LocaleNotifier();
