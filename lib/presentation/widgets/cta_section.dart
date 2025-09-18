import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'max_width.dart';
import '../../generated/l10n/app_localizations.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 640 ? 40 : 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.08),
            Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.03),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary.withValues(alpha: 0.08),
                    Theme.of(context).colorScheme.secondary.withValues(alpha: 0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          MaxWidth(
            child: HoverableCTACard(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.surface,
                      Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth < 640 ? 24 : 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.getStarted,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth < 640 ? 16 : 20),
                    
                    // Main heading
                    Text(
                      AppLocalizations.of(context)!.readyToMakeParentingEasier,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: screenWidth < 640 ? 24 : 28,
                      ),
                    ),
                    SizedBox(height: screenWidth < 640 ? 8 : 12),
                    
                    // Subtitle
                    Text(
                      AppLocalizations.of(context)!.downloadSaraDescription,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.4,
                        fontSize: screenWidth < 640 ? 16 : 18,
                      ),
                    ),
                    SizedBox(height: screenWidth < 640 ? 24 : 32),
                    
                    // Download buttons
                    _buildDownloadButtons(context, screenWidth),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButtons(BuildContext context, double screenWidth) {
    final isMobile = screenWidth < 640;
    
    return Wrap(
      spacing: isMobile ? 12 : 16,
      runSpacing: isMobile ? 12 : 16,
      children: [
        _buildDownloadButton(
          context: context,
          title: AppLocalizations.of(context)!.appStore,
          subtitle: AppLocalizations.of(context)!.downloadForIOS,
          imagePath: 'assets/logos/appstore_badge.png',
          onPressed: () => launchUrl(Uri.parse('https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938')),
          isPrimary: false,
          isMobile: isMobile,
        ),
        _buildDownloadButton(
          context: context,
          title: AppLocalizations.of(context)!.googlePlay,
          subtitle: AppLocalizations.of(context)!.downloadForAndroid,
          imagePath: 'assets/logos/googleplay_badge.png',
          onPressed: () => launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy')),
          isPrimary: true,
          isMobile: isMobile,
        ),
      ],
    );
  }

  Widget _buildDownloadButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String imagePath,
    required VoidCallback onPressed,
    required bool isPrimary,
    required bool isMobile,
  }) {
    return HoverableButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 14 : 16,
        ),
        decoration: BoxDecoration(
          gradient: isPrimary
              ? LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isPrimary
                ? Colors.transparent
                : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isPrimary
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
                  : Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: isPrimary ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: isMobile ? 24 : 28,
              width: isMobile ? 24 : 28,
              fit: BoxFit.contain,
            ),
            SizedBox(width: isMobile ? 8 : 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isPrimary
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isPrimary
                        ? Colors.white.withValues(alpha: 0.9)
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableCTACard extends StatefulWidget {
  final Widget child;

  const HoverableCTACard({
    super.key,
    required this.child,
  });

  @override
  State<HoverableCTACard> createState() => _HoverableCTACardState();
}

class _HoverableCTACardState extends State<HoverableCTACard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: _isHovered
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
                      blurRadius: 32,
                      offset: const Offset(0, 16),
                    ),
                  ],
                )
              : null,
          child: widget.child,
        ),
      ),
    );
  }
}

class HoverableButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const HoverableButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<HoverableButton> createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: widget.child,
        ),
      ),
    );
  }
}
