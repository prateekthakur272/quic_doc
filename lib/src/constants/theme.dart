import 'package:flutter/material.dart';

final themeLight = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue.shade600,
        onPrimary: Colors.white,
        secondary: Colors.green.shade600,
        onSecondary: Colors.white,
        error: Colors.red.shade400,
        onError: Colors.white,
        background: Colors.grey.shade200,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black),
    dividerTheme: DividerThemeData(color: Colors.grey.shade400, thickness: .5),
    inputDecorationTheme:
        const InputDecorationTheme(border: OutlineInputBorder()));

final themeDark = ThemeData.dark();
