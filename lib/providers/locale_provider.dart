import 'package:flutter/material.dart';
import 'package:hooks_riverpod/legacy.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider._internal();
  static final LocaleProvider _instance = LocaleProvider._internal();
  factory LocaleProvider() => _instance;

  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}

final localProvider = ChangeNotifierProvider<LocaleProvider>((ref) {
  return LocaleProvider();
});
