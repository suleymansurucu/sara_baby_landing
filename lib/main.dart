import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/core/max_width.dart';
import 'package:untitled/section/cta_section.dart';
import 'package:untitled/section/developer_section.dart';
import 'package:untitled/section/faq_section.dart';
import 'package:untitled/section/features_section.dart';
import 'package:untitled/section/footer_section.dart';
import 'package:untitled/section/hero_section.dart';
import 'package:untitled/section/screens_section.dart';


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

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  // There are section keys to scroll to
  final _heroKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _screensKey = GlobalKey();
  final _developerKey = GlobalKey();
  final _faqKey = GlobalKey();
  final _ctaKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.1,
    );
  }

  Widget _buildAnimatedSection(GlobalKey key, Widget section, int index) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: section,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 400 && !_showBackToTopButton) {
      setState(() => _showBackToTopButton = true);
    } else if (_scrollController.offset < 400 && _showBackToTopButton) {
      setState(() => _showBackToTopButton = false);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(bottom: BorderSide(color: Colors.black.withOpacity(.06))),
          ),
          child: MaxWidth(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logos/sara_baby_logo.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              // Use MediaQuery for more stable responsive design
                              final screenWidth = MediaQuery.of(context).size.width;
                              double fontSize = 18.0;
                              
                              if (screenWidth < 600) {
                                fontSize = 14.0;
                              } else if (screenWidth < 800) {
                                fontSize = 16.0;
                              } else if (screenWidth < 1000) {
                                fontSize = 17.0;
                              }
                              
                              return Text(
                                'Sara Baby Tracker & Sounds',
                                style: GoogleFonts.poppins(
                              
                                  fontSize: fontSize,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: -0.3,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isPhone(context)) ...[
                  TextButton(
                    onPressed: () => _scrollTo(_heroKey), 
                    child: Text('Home', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_featuresKey), 
                    child: Text('Features', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_screensKey), 
                    child: Text('Screens', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_developerKey), 
                    child: Text('Developer', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_faqKey), 
                    child: Text('FAQ', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () => _scrollTo(_ctaKey),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Get the App', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  ),
                ],
                if (isPhone(context))
                  Builder(
                    builder: (ctx) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: isPhone(context)
          ? Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            // Header with logo and app name
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logos/sara_baby_logo.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Sara Baby Tracker & Sounds',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Menu items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  _buildMenuItem(
                    context,
                    'Home',
                    Icons.home_outlined,
                    () { Navigator.pop(context); _scrollTo(_heroKey); },
                  ),
                  _buildMenuItem(
                    context,
                    'Features',
                    Icons.star_outline,
                    () { Navigator.pop(context); _scrollTo(_featuresKey); },
                  ),
                  _buildMenuItem(
                    context,
                    'Screens',
                    Icons.phone_android_outlined,
                    () { Navigator.pop(context); _scrollTo(_screensKey); },
                  ),
                  _buildMenuItem(
                    context,
                    'Developer',
                    Icons.person_outline,
                    () { Navigator.pop(context); _scrollTo(_developerKey); },
                  ),
                  _buildMenuItem(
                    context,
                    'FAQ',
                    Icons.help_outline,
                    () { Navigator.pop(context); _scrollTo(_faqKey); },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                      onPressed: () { Navigator.pop(context); _scrollTo(_ctaKey); },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.download, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Get the App',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Sections with fade-in animations
            _buildAnimatedSection(_heroKey, const HeroSection(), 0),
            _buildAnimatedSection(_featuresKey, const FeaturesSection(), 1),
            _buildAnimatedSection(_screensKey, const ScreensSection(), 2),
            _buildAnimatedSection(_developerKey, const DeveloperSection(), 3),
            _buildAnimatedSection(_faqKey, const FAQSection(), 4),
            _buildAnimatedSection(_ctaKey, const CTASection(), 5),
            const FooterSection(),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 6,
              child: const Icon(Icons.keyboard_arrow_up),
            )
          : null,
    );
  }
}
