import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/core/max_width.dart';
import 'package:untitled/section/cta_section.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        textTheme: GoogleFonts.interTextTheme(),
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

  // There are section keys to scroll to
  final _heroKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _screensKey = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(bottom: BorderSide(color: Colors.black.withOpacity(.06))),
          ),
          child: MaxWidth(
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Image.asset('assets/logos/sara_baby_logo.png', height: 28, width: 28, fit: BoxFit.cover),
                      const SizedBox(width: 8),
                      const Text('Sara Baby', style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                const Spacer(),
                if (!isPhone(context)) ...[
                  TextButton(onPressed: () => _scrollTo(_heroKey), child: const Text('Home')),
                  TextButton(onPressed: () => _scrollTo(_featuresKey), child: const Text('Features')),
                  TextButton(onPressed: () => _scrollTo(_screensKey), child: const Text('Screens')),
                  TextButton(onPressed: () => _scrollTo(_faqKey), child: const Text('FAQ')),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: () => _scrollTo(_ctaKey),
                    child: const Text('Get the App'),
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(title: const Text('Home'), onTap: () { Navigator.pop(context); _scrollTo(_heroKey); }),
            ListTile(title: const Text('Features'), onTap: () { Navigator.pop(context); _scrollTo(_featuresKey); }),
            ListTile(title: const Text('Screens'), onTap: () { Navigator.pop(context); _scrollTo(_screensKey); }),
            ListTile(title: const Text('FAQ'), onTap: () { Navigator.pop(context); _scrollTo(_faqKey); }),
            ListTile(
              title: const Text('Get the App'),
              onTap: () { Navigator.pop(context); _scrollTo(_ctaKey); },
            ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Bölümlere key atadık
            KeyedSubtree(key: _heroKey, child: const HeroSection()),
            KeyedSubtree(key: _featuresKey, child: const FeaturesSection()),
            KeyedSubtree(key: _screensKey, child: const ScreensSection()),
            KeyedSubtree(key: _faqKey, child: const FAQSection()),
            KeyedSubtree(key: _ctaKey, child: const CTASection()),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
