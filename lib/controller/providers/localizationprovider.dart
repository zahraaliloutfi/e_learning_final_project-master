import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier{
  Locale _currentLocale = const Locale('en'); // Default language

  Locale get currentLocale => _currentLocale;

  void setLocale(Locale newLocale) {
    _currentLocale = newLocale;

    notifyListeners();
  }
}