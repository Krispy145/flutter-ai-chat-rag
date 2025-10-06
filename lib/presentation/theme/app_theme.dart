import "package:flutter/material.dart";

/// Application theme configuration
class AppTheme {
  static const Color primaryColor = Color(0xFF2D70FF);

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(centerTitle: true, elevation: 0, backgroundColor: colorScheme.surface, foregroundColor: colorScheme.onSurface),
      cardTheme: const CardThemeData(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(centerTitle: true, elevation: 0, backgroundColor: colorScheme.surface, foregroundColor: colorScheme.onSurface),
      cardTheme: const CardThemeData(elevation: 2, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
