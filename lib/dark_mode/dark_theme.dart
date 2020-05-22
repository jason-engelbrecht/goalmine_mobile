import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.red,
      canvasColor: isDarkTheme ? Colors.grey[-50] : Colors.grey[50],
      backgroundColor: isDarkTheme ? Colors.white : Colors.grey,
      disabledColor: Colors.grey,
      accentColor: Colors.red[400],
      toggleableActiveColor: Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        color: isDarkTheme ? Colors.grey : Colors.white,
        elevation: 2.5,
      ),
    );
  }
}
