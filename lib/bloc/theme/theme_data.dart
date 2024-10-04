import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData theme1 = ThemeData(
    primaryColor: const Color(0xFFf34509),
    scaffoldBackgroundColor: Color(0xFFf34509).withOpacity(0.05),
    appBarTheme: const AppBarTheme(color: Color(0xFFf34509)),
    iconTheme: const IconThemeData(color: Color(0xFFf34509)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFf34509)),
      bodyMedium: TextStyle(color: Color(0xFFf34509)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFf34509),
      primary: Color(0xFFf34509),
      secondary: Color(0xFFf34509),
    ),
  );

  static final ThemeData theme2 = ThemeData(
    primaryColor: const Color(0xFF20053d),
    scaffoldBackgroundColor: Color(0xFFF8F7FA), // Light purple-tinted background
    appBarTheme: const AppBarTheme(
      color: Color(0xFF20053d),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(color: Color(0xFF20053d)),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Color(0xFF20053d), fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Color(0xFF20053d), fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: Color(0xFF333333)),
      bodyMedium: TextStyle(color: Color(0xFF666666)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF20053d),
      primary: Color(0xFF20053d),
      secondary: Color(0xFF9C27B0), // A complementary purple
      background: Color(0xFFF8F7FA),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color(0xFF333333),
      onSurface: Color(0xFF333333),
    ),
  );

  static final ThemeData theme3 = ThemeData(
    primaryColor: Color(0xFF445b4b),
    scaffoldBackgroundColor: Color(0xFF445b4b).withOpacity(0.1), // Lighter shade of the primary color
    appBarTheme: AppBarTheme(color: Color(0xFF445b4b)),
    iconTheme: IconThemeData(color: Color(0xFF445b4b)),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF445b4b).withOpacity(0.8)), // Slightly darker than primary
      bodyMedium: TextStyle(color: Color(0xFF445b4b).withOpacity(0.9)), // Slightly lighter than bodyLarge
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF445b4b),
      primary: Color(0xFF445b4b),
      secondary: Color(0xFF6B8E23), // A complementary green color
    ),
  );
}