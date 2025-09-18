import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
import 'constants/app_routes.dart';
import 'services/language_service.dart';
import 'services/route_service.dart';
import 'services/deep_link_service.dart';
import 'services/language_change_notifier.dart';
import 'generated/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'presentation/pages/landing_page.dart';
import 'presentation/pages/privacy_policy_page.dart';
import 'presentation/pages/terms_of_service_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Use path URL strategy instead of hash
  if (kIsWeb) {
    usePathUrlStrategy();
  }
  
  // Initialize deep link service for web
  DeepLinkService.initialize();
  
  runApp(const SaraLandingApp());
}

class SaraLandingApp extends StatefulWidget {
  const SaraLandingApp({super.key});
  
  @override
  State<SaraLandingApp> createState() => _SaraLandingAppState();
}

class _SaraLandingAppState extends State<SaraLandingApp> {
  Locale _currentLocale = const Locale('en');
  late StreamSubscription<String> _languageChangeSubscription;
  late final GoRouter _router;
  
  @override
  void initState() {
    super.initState();
    _loadLocale();
    
    // Initialize GoRouter
    _router = GoRouter(
      initialLocation: AppRoutes.home,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: AppRoutes.privacyPolicy,
          builder: (context, state) => const PrivacyPolicyPage(),
        ),
        GoRoute(
          path: AppRoutes.termsOfService,
          builder: (context, state) => const TermsOfServicePage(),
        ),
      ],
    );
    
    // Listen to language changes
    _languageChangeSubscription = LanguageChangeNotifier().languageChangeStream.listen((languageCode) {
      _loadLocale();
    });
  }
  
  @override
  void dispose() {
    _languageChangeSubscription.cancel();
    super.dispose();
  }
  
  Future<void> _loadLocale() async {
    final locale = await LanguageService.getCurrentLocale();
    if (mounted) {
      setState(() {
        _currentLocale = locale;
      });
    }
  }
  
  void _onLanguageChanged() {
    _loadLocale();
  }
  
  @override
  Widget build(BuildContext context) {
        return MaterialApp.router(
          title: 'Sara Baby Tracker & Sounds',
          debugShowCheckedModeBanner: false,
          locale: _currentLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LanguageService.supportedLocales,
      theme: ThemeData(
        colorScheme: AppColors.colorScheme,
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
      routerConfig: _router,
        );
  }
}
