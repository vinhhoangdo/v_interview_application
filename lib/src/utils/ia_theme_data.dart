import 'package:flutter/material.dart';

class IAThemeData {
  IAThemeData._();

  static const Color _lightPrimaryColor = Colors.black;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;
  static const Color _lightButtonPrimaryColor = Colors.orangeAccent;
  static const Color _lightAppBarColor = Colors.deepPurple;
  static const Color _lightIconColor = Colors.black;
  static const Color _lightSnackBarBackgroundErrorColor = Colors.redAccent;

  static const TextStyle _lightScreenTaskNameTextStyle =
      TextStyle(fontSize: 16.0, color: _lightOnPrimaryColor);
  static const TextStyle _lightScreenButtonTextStyle = TextStyle(
      fontSize: 14.0, color: _lightOnPrimaryColor, fontWeight: FontWeight.w500);

  static const TextTheme _lightTextTheme = TextTheme(
    labelMedium: _lightScreenButtonTextStyle,
    titleMedium: _lightScreenTaskNameTextStyle,
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: const AppBarTheme(
      color: _lightAppBarColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: _lightSnackBarBackgroundErrorColor),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    buttonTheme: const ButtonThemeData(
        buttonColor: _lightButtonPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: _lightPrimaryColor,
      labelStyle: TextStyle(
        color: _lightPrimaryColor,
      ),
    ),
  );
}
