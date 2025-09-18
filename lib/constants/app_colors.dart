import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Color Scheme
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF8B7CF8), // Soft lavender
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFF0EFFF), // Light lavender background
    onPrimaryContainer: Color(0xFF2D1B69),
    secondary: Color(0xFFF8A8B8), // Blush pink
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFF0F2), // Light pink background
    onSecondaryContainer: Color(0xFF590D22),
    tertiary: Color(0xFF87CEEB), // Baby blue
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE0F2FF), // Light blue background
    onTertiaryContainer: Color(0xFF001B3E),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFFBFE),
    onSurface: Color(0xFF1C1B1F),
    surfaceContainerHighest: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC4D0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFDAC2FF),
    surfaceTint: Color(0xFF8B7CF8),
  );

  // Individual color constants for easy access
  static const Color primary = Color(0xFF8B7CF8);
  static const Color secondary = Color(0xFFF8A8B8);
  static const Color tertiary = Color(0xFF87CEEB);
  static const Color error = Color(0xFFBA1A1A);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF1C1B1F);
}
