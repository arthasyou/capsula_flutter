import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('zh'),
    const Locale('zh', 'TW'),
  ];

  static String getFlag(Locale locale) {
    final code = locale.toString();
    switch (code) {
      case 'zh':
        return '🇨🇳';
      case 'zh_TW':
        return '🇭🇰';
      case 'en':
      default:
        return '🇺🇸';
    }
  }

  static String getName(Locale locale) {
    final code = locale.toString();
    switch (code) {
      case 'zh':
        return '简体中文';
      case 'zh_TW':
        return '繁體中文';
      case 'en':
      default:
        return 'English';
    }
  }

  static String getCurrencySymbol(Locale locale) {
    final code = locale.countryCode?.toLowerCase();
    // ignore: avoid_print
    print('Locale code for currency: $code');
    switch (code) {
      case 'zh':
        return '￥';
      case 'zh_TW':
        return 'NT\$';
      case 'en':
      default:
        return '\$';
    }
  }
}
