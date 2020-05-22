import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.red,
      canvasColor: isDarkTheme ? Colors.grey[-50] : Colors.grey[50],
      backgroundColor: isDarkTheme ? Colors.white : Colors.grey,
      bottomAppBarColor: isDarkTheme ? Colors.green : Colors.green,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Colors.grey : Color(0xffEECED3),
      disabledColor: Colors.grey,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        color: isDarkTheme ? Colors.grey : Colors.white,
        elevation: 0.0,
      ),
    );
  }
}
