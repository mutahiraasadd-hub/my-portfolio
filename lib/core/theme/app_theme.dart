// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- 1. Define the Beige-Brown Color Palette (based on image_6.png) ---
  static const Color lightBackground = Color(0xFFFFF0F0); // Light pinkish-beige background
  static const Color lightSurface = Color(0xFFFFFFFF); // Card/Container surface (white for contrast)
  static const Color lightPrimary = Color(0xFF5D3C3C); // Dark brown accent color (buttons, icons, important text)
  static const Color lightTextPrimary = Color(0xFF5D3C3C); // Dark brown primary text
  static const Color lightTextSecondary = Color(0xFF7E6060); // A lighter brown for secondary text

  // --- Define the existing Dark-Neon Color Palette ---
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkPrimary = Color(0xFF00E5FF);
  static const Color darkSecondary = Color(0xFF00FF9D);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  // --- 2. Create the "light" beige-brown theme object ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      // We remove 'const' here to fix the errors from your old file
      colorScheme: ColorScheme.light(
        primary: lightPrimary,
        secondary: lightPrimary, // Monochromatic accent look
        surface: lightSurface,
        background: lightBackground,
        onBackground: lightTextPrimary,
        onSurface: lightTextPrimary,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.light().textTheme,
      ).apply(bodyColor: lightTextPrimary, displayColor: lightTextPrimary),
      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        elevation: 0,
        centerTitle: true,
        // Make icons and title brown
        iconTheme: IconThemeData(color: lightTextPrimary),
        titleTextStyle: TextStyle(color: lightTextPrimary, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimary, // Brown button background
          foregroundColor: lightSurface, // White text on brown button
        ),
      ),
      // Style for 'View Work' outlined button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: lightPrimary), // Brown outline
          foregroundColor: lightPrimary, // Brown text
        ),
      ),
    );
  }

  // --- 3. A corrected and complete version of your old dark theme ---
  // This part is now fixed and error-free, should you ever wish to use dark mode again.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: ColorScheme.dark(
        primary: darkPrimary,
        secondary: darkSecondary,
        surface: darkSurface,
        background: darkBackground,
        onBackground: darkTextPrimary,
        onSurface: darkTextPrimary,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: darkTextPrimary, displayColor: darkTextPrimary),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: darkTextPrimary),
        titleTextStyle: TextStyle(color: darkTextPrimary, fontSize: 20, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimary, // Neon blue button
          foregroundColor: darkBackground, // Dark background on button text
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: darkPrimary), // Neon blue outline
          foregroundColor: darkPrimary, // Neon blue text
        ),
      ),
    );
  }
}