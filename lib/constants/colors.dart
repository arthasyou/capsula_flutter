import 'package:flutter/material.dart';

class ColorConstants {
  // App Basic Colors (Brand Colors)
  static const Color primary = Color(0xFF4B68FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);

  // Error and Validation Colors
  static const Color error = Color(0xFFFF4B4B);
  static const Color warning = Color(0xFFFFA24B);
  static const Color success = Color(0xFF388E3C);
  static const Color info = Color(0xFF1976D2);

  // Neutral shades
  static const Color neutralLight = Color(0xFFF5F5F5);
  static const Color neutralDark = Color(0xFF3C3C3C);
  static const Color neutralDarkGrey = Color(0xFF939393);
  static const Color neutralGrey = Color(0xFFE0E0E0);

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4B68FF), Color(0xFFB0C7FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFFFE24B), Color(0xFFFFA24B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient accentGradient = LinearGradient(
    colors: [Color(0xFFB0C7FF), Color(0xFF4B68FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static MaterialColor primaryMaterialColor =
      const MaterialColor(0xFF4B68FF, <int, Color>{
        50: Color(0xFFE8ECFF),
        100: Color(0xFFC5D0FF),
        200: Color(0xFF9FB1FF),
        300: Color(0xFF7892FF),
        400: Color(0xFF5C7AFF),
        500: Color(0xFF4B68FF),
        600: Color(0xFF4460FF),
        700: Color(0xFF3A55FF),
        800: Color(0xFF314BFF),
        900: Color(0xFF1F3AFF),
      });
}
