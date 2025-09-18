import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/max_width.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/screens_section.dart';
import '../widgets/developer_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/cta_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/language_selector.dart';
import '../controllers/landing_controller.dart';
import '../../domain/usecases/get_app_info.dart';
import '../../domain/usecases/get_features.dart';
import '../../domain/usecases/get_faq_items.dart';
import '../../data/repositories/app_info_repository.dart';
import '../../data/repositories/feature_repository.dart';
import '../../data/repositories/faq_repository.dart';
import '../../generated/l10n/app_localizations.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  late LandingController _controller;

  // Section keys for scrolling
  final _heroKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _screensKey = GlobalKey();
  final _developerKey = GlobalKey();
  final _faqKey = GlobalKey();
  final _ctaKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    
    // Initialize controller with dependencies
    _controller = LandingController(
      GetAppInfo(AppInfoRepositoryImpl()),
      GetFeatures(FeatureRepositoryImpl()),
      GetFAQItems(FAQRepositoryImpl()),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load data after dependencies are available (including localization)
    if (_controller.isLoading) {
      _controller.loadData(context);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 400 && !_showBackToTopButton) {
      setState(() => _showBackToTopButton = true);
    } else if (_scrollController.offset < 400 && _showBackToTopButton) {
      setState(() => _showBackToTopButton = false);
    }
  }

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

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.selectLanguage,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          content: const LanguageSelector(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        );
      },
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

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
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
        hoverColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
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
            border: Border(bottom: BorderSide(color: Colors.black.withValues(alpha: .06))),
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
                                color: Colors.black.withValues(alpha: 0.1),
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
                    child: Text(AppLocalizations.of(context)!.home, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_featuresKey), 
                    child: Text(AppLocalizations.of(context)!.features, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_screensKey), 
                    child: Text(AppLocalizations.of(context)!.screens, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_developerKey), 
                    child: Text(AppLocalizations.of(context)!.developer, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_faqKey), 
                    child: Text(AppLocalizations.of(context)!.faq, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 8),
                  const LanguageSelector(isCompact: true),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () => _scrollTo(_ctaKey),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(AppLocalizations.of(context)!.getTheApp, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
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
                              color: Colors.black.withValues(alpha: 0.1),
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.home,
                    Icons.home_outlined,
                    () { Navigator.pop(context); _scrollTo(_heroKey); },
                  ),
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.features,
                    Icons.star_outline,
                    () { Navigator.pop(context); _scrollTo(_featuresKey); },
                  ),
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.screens,
                    Icons.phone_android_outlined,
                    () { Navigator.pop(context); _scrollTo(_screensKey); },
                  ),
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.developer,
                    Icons.person_outline,
                    () { Navigator.pop(context); _scrollTo(_developerKey); },
                  ),
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.faq,
                    Icons.help_outline,
                    () { Navigator.pop(context); _scrollTo(_faqKey); },
                  ),
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.language,
                    Icons.language,
                    () { Navigator.pop(context); _showLanguageDialog(); },
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
                            AppLocalizations.of(context)!.getTheApp,
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
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          if (_controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_controller.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.errorLoadingContent(_controller.error!),
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _controller.loadData(context),
                    child: Text(AppLocalizations.of(context)!.retry),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildAnimatedSection(_heroKey, HeroSection(appInfo: _controller.appInfo!), 0),
                _buildAnimatedSection(_featuresKey, FeaturesSection(features: _controller.features), 1),
                _buildAnimatedSection(_screensKey, const ScreensSection(), 2),
                _buildAnimatedSection(_developerKey, const DeveloperSection(), 3),
                _buildAnimatedSection(_faqKey, FAQSection(faqItems: _controller.faqItems), 4),
                _buildAnimatedSection(_ctaKey, const CTASection(), 5),
                const FooterSection(),
              ],
            ),
          );
        },
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
