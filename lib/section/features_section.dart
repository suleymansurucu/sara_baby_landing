import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final features = [
      FeatureData(
        title: 'Feeding Tracker',
        description: 'Track every feeding session with ease—breastfeeding, bottle feeding, and pumping.',
        iconAsset: 'assets/images/feed.png',
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFC44569)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Sleep Tracker',
        description: 'Monitor sleep with precise timers and built-in white noise to help your baby sleep.',
        iconAsset: 'assets/images/sleep.png',
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Diaper Log',
        description: 'Quickly log wet, dirty, or mixed diapers with easy shortcuts and history.',
        iconAsset: 'assets/images/diaper.png',
        gradient: const LinearGradient(
          colors: [Color(0xFFF093FB), Color(0xFFF5576C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Growth & Milestones',
        description: 'Log weight, height, and track milestones, teething, and vaccinations.',
        iconAsset: 'assets/images/growth.png',
        gradient: const LinearGradient(
          colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Relaxing Sounds',
        description: 'Play soothing sounds and white noise to help your baby drift off.',
        iconAsset: 'assets/images/sounds_icon.png',
        gradient: const LinearGradient(
          colors: [Color(0xFFA8E6CF), Color(0xFFDCEDC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Baby Recipes',
        description: 'Discover healthy, age-filtered recipes with ingredients and instructions.',
        iconAsset: 'assets/images/recipe_icon.png',
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD93D), Color(0xFFFF8C42)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Activity History',
        description: 'View a clear timeline of your baby\'s day with search and filter options.',
        iconAsset: 'assets/images/activity_history.png',
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FeatureData(
        title: 'Shared Family Access',
        description: 'Collaborate with caregivers and easily switch between multiple babies.',
        iconAsset: 'assets/images/share_family_icon.png',
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFC44569)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 640 ? 40 : 80),
      color: Theme.of(context).colorScheme.surface,
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Container(
              margin: EdgeInsets.only(bottom: screenWidth < 640 ? 32 : 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '✨ Features',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Complete Baby Care Solution',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Everything you need to track your baby\'s development and create a nurturing environment.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Features grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(screenWidth),
                crossAxisSpacing: screenWidth < 480 ? 8 : (screenWidth < 640 ? 10 : 20),
                mainAxisSpacing: screenWidth < 480 ? 8 : (screenWidth < 640 ? 10 : 20),
                childAspectRatio: _getAspectRatio(screenWidth),
              ),
              itemCount: features.length,
              itemBuilder: (context, index) {
                return _buildFeatureCard(context, features[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 480) return 1; // Very small mobile
    if (width < 640) return 2; // Mobile - 2 columns
    if (width < 900) return 2; // Small tablet
    if (width < 1200) return 3; // Large tablet
    return 4; // Desktop
  }

  double _getAspectRatio(double width) {
    if (width < 480) return 1.6; // Very small mobile - more vertical
    if (width < 640) return 1.0; // Mobile 2-column - square
    if (width < 900) return 1.1; // Small tablet
    if (width < 1200) return 1.0; // Large tablet - square
    return 1.0; // Desktop - square
  }

  Widget _buildFeatureCard(BuildContext context, FeatureData feature) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmallMobile = screenWidth < 480;
    final isMobile = screenWidth < 640;
    
    return HoverableCard(
      gradient: feature.gradient,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(isVerySmallMobile ? 12 : (isMobile ? 14 : 20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Feature icon
              Container(
                width: isVerySmallMobile ? 36 : (isMobile ? 40 : 48),
                height: isVerySmallMobile ? 36 : (isMobile ? 40 : 48),
                decoration: BoxDecoration(
                  gradient: feature.gradient,
                  borderRadius: BorderRadius.circular(isVerySmallMobile ? 8 : (isMobile ? 10 : 12)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(isVerySmallMobile ? 5 : (isMobile ? 6 : 8)),
                  child: Image.asset(
                    feature.iconAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: isVerySmallMobile ? 8 : (isMobile ? 10 : 16)),

              // Feature title
              Text(
                feature.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: isVerySmallMobile ? 16 : (isMobile ? 17 : 18),
                ),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: isVerySmallMobile ? 4 : (isMobile ? 5 : 8)),

              // Feature description
              Text(
                feature.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.3,
                  fontSize: isVerySmallMobile ? 13 : (isMobile ? 14 : 14),
                ),
                maxLines: isVerySmallMobile ? 3 : (isMobile ? 4 : 3),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverableCard extends StatefulWidget {
  final Widget child;
  final LinearGradient gradient;

  const HoverableCard({
    super.key,
    required this.child,
    required this.gradient,
  });

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: _isHovered
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: widget.gradient.colors.first.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: widget.gradient.colors.last.withOpacity(0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 16),
                    ),
                  ],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
          child: widget.child,
        ),
      ),
    );
  }
}

class FeatureData {
  final String title;
  final String description;
  final String iconAsset;
  final LinearGradient gradient;

  const FeatureData({
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.gradient,
  });
}