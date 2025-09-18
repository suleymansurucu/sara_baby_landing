import 'package:flutter/material.dart';
import 'max_width.dart';
import '../../domain/entities/feature.dart';

class FeaturesSection extends StatelessWidget {
  final List<Feature> features;
  
  const FeaturesSection({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 640 ? 40 : 80),
      color: Theme.of(context).colorScheme.surface,
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    if (width < 480) return 1;
    if (width < 640) return 2;
    if (width < 900) return 2;
    if (width < 1200) return 3;
    return 4;
  }

  double _getAspectRatio(double width) {
    if (width < 480) return 2.2;
    if (width < 640) return 1.3;
    if (width < 900) return 1.1;
    if (width < 1200) return 1.0;
    return 1.0;
  }

  Widget _buildFeatureCard(BuildContext context, Feature feature) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmallMobile = screenWidth < 480;
    final isMobile = screenWidth < 640;
    
    // Convert hex strings to Color objects
    final gradientColors = feature.gradientColors.map((color) {
      return Color(int.parse(color.replaceFirst('0x', '0xFF')));
    }).toList();
    
    final gradient = LinearGradient(
      colors: gradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    
    return HoverableCard(
      gradient: gradient,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(isVerySmallMobile ? 10 : (isMobile ? 12 : 20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: isVerySmallMobile ? 36 : (isMobile ? 40 : 48),
                height: isVerySmallMobile ? 36 : (isMobile ? 40 : 48),
                decoration: BoxDecoration(
                  gradient: gradient,
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
              SizedBox(height: isVerySmallMobile ? 6 : (isMobile ? 8 : 16)),
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
              SizedBox(height: isVerySmallMobile ? 3 : (isMobile ? 4 : 8)),
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
