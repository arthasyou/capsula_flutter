import 'package:flutter/material.dart';

class ColorConstants {
  // App Basic Colors
  static const Color primary = Color(0xFF4B68FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFB0C7FF);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withValues(alpha: 0.1);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4B68FF);
  static const Color buttonSecondary = Color(0xFFFFE24B);
  static const Color buttonAccent = Color(0xFFB0C7FF);
  static const Color buttonDisabled = Color(0xFFB0B0B0);

  // Border Colors
  static const Color borderLight = Color(0xFFD1D1D1);
  static const Color borderDark = Color(0xFF4B4B4B);

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
      const MaterialColor(0xFF9581FF, <int, Color>{
        50: Color(0xFFEFECFF),
        100: Color(0xFFD7D0FF),
        200: Color(0xFFBDB0FF),
        300: Color(0xFFA390FF),
        400: Color(0xFF8F79FF),
        500: Color(0xFF7B61FF),
        600: Color(0xFF7359FF),
        700: Color(0xFF684FFF),
        800: Color(0xFF5E45FF),
        900: Color(0xFF6C56DD),
      });
}
