import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const primary = Color(0xFF2D5A8E);
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
  );
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, primary: primary),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFEEEEEE),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: inputBorder,
      enabledBorder: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(0, 44),
        shape: buttonShape,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        minimumSize: const Size(double.infinity, 44),
        side: const BorderSide(color: Color(0xFFE0E0E0)),
        shape: buttonShape,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
  );
}