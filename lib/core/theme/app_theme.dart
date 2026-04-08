import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF1DB954);
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF212121);
  static const Color surfaceVariant = Color(0xFF2A2A2A);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color error = Color(0xFFCF6679);

  // Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle bodyText = TextStyle(fontSize: 14, color: textPrimary);

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: textSecondary,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primaryGreen,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,

    colorScheme: const ColorScheme.dark(
      primary: primaryGreen,
      surface: surface,
      error: error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      titleTextStyle: headingMedium,
      iconTheme: IconThemeData(color: textPrimary),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: background,
      selectedItemColor: primaryGreen,
      unselectedItemColor: textSecondary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.black,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryGreen),
    ),

    iconTheme: const IconThemeData(color: textPrimary),

    dividerColor: surfaceVariant,

    fontFamily: 'Circular',
  );
}
