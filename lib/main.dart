import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/pages/landing_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SaraLandingApp());
}

class SaraLandingApp extends StatelessWidget {
  const SaraLandingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sara Baby Tracker & Sounds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
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
          surfaceVariant: Color(0xFFE7E0EC),
          onSurfaceVariant: Color(0xFF49454F),
          outline: Color(0xFF79747E),
          outlineVariant: Color(0xFFCAC4D0),
          shadow: Color(0xFF000000),
          scrim: Color(0xFF000000),
          inverseSurface: Color(0xFF313033),
          onInverseSurface: Color(0xFFF4EFF4),
          inversePrimary: Color(0xFFDAC2FF),
          surfaceTint: Color(0xFF8B7CF8),
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          displayLarge: GoogleFonts.inter(
            fontSize: 57,
            fontWeight: FontWeight.w400,
            height: 1.12,
            letterSpacing: -0.25,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 45,
            fontWeight: FontWeight.w400,
            height: 1.16,
            letterSpacing: 0,
          ),
          displaySmall: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.w400,
            height: 1.22,
            letterSpacing: 0,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            height: 1.25,
            letterSpacing: 0,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            height: 1.29,
            letterSpacing: 0,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.33,
            letterSpacing: 0,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 1.27,
            letterSpacing: 0,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
            letterSpacing: 0.15,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
            letterSpacing: 0.1,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            letterSpacing: 0.25,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.33,
            letterSpacing: 0.4,
          ),
          labelLarge: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
            letterSpacing: 0.1,
          ),
          labelMedium: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.33,
            letterSpacing: 0.5,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.45,
            letterSpacing: 0.5,
          ),
        ),
        useMaterial3: true,
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad},
      ),
      home: const LandingPage(),
    );
  }
}

