import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en'); // Default locale

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    // Corrected parameter name
    if (newLocale != _locale) {
      _locale = newLocale;
      notifyListeners(); // Notify listeners about the change
    }
  }
}
