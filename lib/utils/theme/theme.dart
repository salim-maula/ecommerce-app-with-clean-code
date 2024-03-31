import 'package:cwt_ecommerce/utils/theme/custom_theme/appbar_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/chip_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/text_field_theme.dart';
import 'package:cwt_ecommerce/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._(); //to avoid creating instance

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButton.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    
  );
  static ThemeData darkTheme = ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButton.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
