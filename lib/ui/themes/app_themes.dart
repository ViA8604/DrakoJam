import 'package:flutter/material.dart';

Color burgundyColor = const Color(0xFF8B0A1A);

MaterialColor mahoganyColor = const MaterialColor(
  0xFF470000,
  {
    50: Color.fromRGBO(71, 0, 0, 0.1),
    100: Color.fromRGBO(65, 0, 0, 0.2),
    200: Color.fromRGBO(59, 0, 0, 0.3),
    300: Color.fromRGBO(53, 0, 0, 0.4),
    400: Color.fromRGBO(47, 0, 0, 0.5),
    500: Color.fromRGBO(41, 0, 0, 0.6),
    600: Color.fromRGBO(35, 0, 0, 0.7),
    700: Color.fromRGBO(29, 0, 0, 0.8),
    800: Color.fromRGBO(23, 0, 0, 0.9),
    900: Color.fromRGBO(17, 0, 0, 1),
  },
);

ThemeData classicTheme = ThemeData(
  primarySwatch: mahoganyColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: mahoganyColor,
  ).copyWith(
    secondary: burgundyColor, // Use secondary instead of accentColor
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 24, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 18, color: Colors.grey),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
  ),
);

ThemeData classicThemeDark = ThemeData(
  primarySwatch: mahoganyColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: mahoganyColor,
  ).copyWith(
    secondary: burgundyColor, // Use secondary instead of accentColor
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Color de fondo oscuro
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 24, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 18, color: Colors.grey),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
  ),
);
