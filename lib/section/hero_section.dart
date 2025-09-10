import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/core/max_width.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = isPhone(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.9),
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: MaxWidth(
        child: isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // Device mockup
        _buildDeviceMockup(context),

        const SizedBox(height: 32),

        // App title and description
        Text(
          'Sara Baby Tracker & Sounds',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            height: 1.1,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        
        // Separator line
        Container(
          width: 80,
          height: 1,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        
        const SizedBox(height: 20),
        
        Text(
          'All-in-one baby care: Track, Feed, Sleep, and Grow Together.',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white.withOpacity(0.95),
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        
        // Separator line
        Container(
          width: 100,
          height: 1,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        
        const SizedBox(height: 16),
        
        Text(
          'Sara is an open-source Flutter app that helps parents and caregivers track daily baby activities, share responsibilities, and create a calm environment with soothing sleep sounds and baby food recipes.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 32),

        // CTAs
        _buildCTAs(context),

        const SizedBox(height: 24),

        // Open source note
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '✨ Fully Open Source',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left side - Content
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // App title
              Text(
                'Sara Baby Tracker & Sounds',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              
              // Separator line
              Container(
                width: 100,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              
              const SizedBox(height: 20),

              // Value proposition
              Text(
                'All-in-one baby care: Track, Feed, Sleep, and Grow Together.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white.withOpacity(0.95),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              
              // Separator line
              Container(
                width: 120,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              
              const SizedBox(height: 16),

              // Description
              Text(
                'Sara is an open-source Flutter app that helps parents and caregivers track daily baby activities, share responsibilities, and create a calm environment with soothing sleep sounds and baby food recipes.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // CTAs
              _buildCTAs(context),

              const SizedBox(height: 24),

              // Open source note
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '✨ Fully Open Source',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 80),

        // Right side - Device mockup
        Expanded(
          flex: 4,
          child: Center(
            child: _buildDeviceMockup(context),
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceMockup(BuildContext context) {
    return Container(
      width: isPhone(context) ? 250 : 320,
      height: isPhone(context) ? 500 : 640,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Device frame (simplified iPhone-like)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Screen content
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/track_activity.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Notch
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 80),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAs(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // App Store
        _HoverableButton(
          onTap: () => launchUrl(Uri.parse('https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938')),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logos/appstore_badge.png',
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                Text(
                  'App Store',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Google Play
        _HoverableButton(
          onTap: () => launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy')),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logos/googleplay_badge.png',
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                Text(
                  'Google Play',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // GitHub
        _HoverableButton(
          onTap: () => launchUrl(Uri.parse('https://github.com/suleymansurucu/flutter_sara_baby_tracker_and_sounds')),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => launchUrl(Uri.parse('https://github.com/suleymansurucu/flutter_sara_baby_tracker_and_sounds')),
            icon: const Icon(Icons.code, size: 20),
            label: const Text('View GitHub'),
          ),
        ),
      ],
    );
  }
}

class _HoverableButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _HoverableButton({required this.child, this.onTap});

  @override
  State<_HoverableButton> createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<_HoverableButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          child: widget.child,
        ),
      ),
    );
  }
}

