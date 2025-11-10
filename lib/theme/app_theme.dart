import 'package:flutter/material.dart';
import 'package:capsula_flutter/constants/colors.dart';

import '../constants/constants.dart';
import 'button_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_thems.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      primarySwatch: ColorConstants.primaryMaterialColor,
      primaryColor: ColorConstants.primary,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      textTheme: CustomTextTheme.lightTextTheme,
      chipTheme: CustomChipTheme.lightChipTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
      checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
      appBarTheme: CustomAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
      colorScheme: ColorScheme.light(
        // Primary colors
        primary: ColorConstants.primary,
        onPrimary: Colors.white,
        primaryContainer: ColorConstants.primary.withValues(alpha: 0.2),
        onPrimaryContainer: ColorConstants.primary,

        // Secondary colors
        secondary: ColorConstants.secondary,
        onSecondary: Colors.black87,
        secondaryContainer: ColorConstants.secondary.withValues(alpha: 0.2),
        onSecondaryContainer: Colors.black87,

        // Tertiary colors (using accent)
        tertiary: ColorConstants.accent,
        onTertiary: Colors.black87,
        tertiaryContainer: ColorConstants.accent.withValues(alpha: 0.2),
        onTertiaryContainer: Colors.black87,

        // Surface colors
        surface: Colors.white,
        onSurface: Colors.black,
        onSurfaceVariant: Colors.black.withValues(alpha: 0.6),
        surfaceContainerHighest: Colors.grey[200]!,
        surfaceContainer: Colors.grey[100]!,
        surfaceContainerLow: Colors.grey[50]!,

        // Error colors
        error: ColorConstants.error,
        onError: Colors.white,
        errorContainer: ColorConstants.error.withValues(alpha: 0.2),
        onErrorContainer: ColorConstants.error,

        // Outline colors
        outline: Colors.grey[400]!,
        outlineVariant: Colors.grey[300]!,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: "Plus Jakarta",
      primarySwatch: ColorConstants.primaryMaterialColor,
      primaryColor: ColorConstants.primary,
      scaffoldBackgroundColor: ColorConstants.dark,
      iconTheme: const IconThemeData(color: whiteColor),
      textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: CustomOutlinedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
      checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
      appBarTheme: CustomAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableDarkThemeData,
      colorScheme: ColorScheme.dark(
        // Primary colors
        primary: ColorConstants.primary,
        onPrimary: Colors.white,
        primaryContainer: ColorConstants.primary.withValues(alpha: 0.3),
        onPrimaryContainer: ColorConstants.primary.withValues(alpha: 1.0),

        // Secondary colors
        secondary: ColorConstants.secondary,
        onSecondary: Colors.black87,
        secondaryContainer: ColorConstants.secondary.withValues(alpha: 0.3),
        onSecondaryContainer: ColorConstants.secondary,

        // Tertiary colors (using accent)
        tertiary: ColorConstants.accent,
        onTertiary: Colors.black87,
        tertiaryContainer: ColorConstants.accent.withValues(alpha: 0.3),
        onTertiaryContainer: ColorConstants.accent,

        // Surface colors
        surface: ColorConstants.dark,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.white.withValues(alpha: 0.6),
        surfaceContainerHighest: Colors.grey[800]!,
        surfaceContainer: Colors.grey[850]!,
        surfaceContainerLow: Colors.grey[900]!,

        // Error colors
        error: ColorConstants.error,
        onError: Colors.white,
        errorContainer: ColorConstants.error.withValues(alpha: 0.3),
        onErrorContainer: ColorConstants.error,

        // Outline colors
        outline: Colors.grey[600]!,
        outlineVariant: Colors.grey[700]!,
      ),
    );
  }
}
