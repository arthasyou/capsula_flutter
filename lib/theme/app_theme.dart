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
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      primarySwatch: ColorConstants.primaryMaterialColor,
      primaryColor: ColorConstants.primary,
      scaffoldBackgroundColor: Colors.white,
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
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
