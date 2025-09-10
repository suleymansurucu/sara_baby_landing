import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final faqs = [
      FAQData(
        question: 'Is the app free?',
        answer: 'Yes, Sara is completely free to download and use. The app and this landing site are fully open-source, allowing anyone to review, contribute, or modify the code.',
        icon: Icons.monetization_on_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD93D), Color(0xFFFF8C42)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FAQData(
        question: 'Is my data private?',
        answer: 'Your baby\'s data is stored locally on your device for maximum privacy and security. We don\'t collect or transmit personal information. All tracking data remains on your device, giving you full control over your family\'s information.',
        icon: Icons.security_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FAQData(
        question: 'Can multiple caregivers use it?',
        answer: 'Yes! Sara supports multiple caregivers with shared family access. You can easily switch between different caregivers and maintain separate profiles for multiple babies in the same household.',
        icon: Icons.family_restroom_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFC44569)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FAQData(
        question: 'Does it work offline?',
        answer: 'Absolutely. Core tracking features work completely offline - you can log feeds, sleep, diapers, and growth data without an internet connection. Data syncs automatically when you\'re back online.',
        icon: Icons.wifi_off_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FAQData(
        question: 'Does Sara support both iOS and Android?',
        answer: 'Yes! Sara is available for both iOS and Android devices. Download links are available above, and both versions offer the same features and functionality.',
        icon: Icons.phone_android_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFFA8E6CF), Color(0xFFDCEDC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      FAQData(
        question: 'How do I backup my data?',
        answer: 'Your data is automatically saved locally on your device. For additional security, you can export your baby\'s records as CSV files or use the built-in backup features to ensure your precious memories are always safe.',
        icon: Icons.backup_outlined,
        gradient: const LinearGradient(
          colors: [Color(0xFFF093FB), Color(0xFFF5576C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 640 ? 40 : 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.primary.withOpacity(0.02),
            Theme.of(context).colorScheme.secondary.withOpacity(0.03),
            Theme.of(context).colorScheme.tertiary.withOpacity(0.01),
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.08),
                    Theme.of(context).colorScheme.primary.withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: -120,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary.withOpacity(0.06),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.02),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          MaxWidth(
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
                          '❓ FAQ',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Frequently Asked Questions',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: screenWidth < 640 ? 24 : 28,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Everything you need to know about Sara and how it can help your family.',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.4,
                          fontSize: screenWidth < 640 ? 16 : 18,
                        ),
                      ),
                    ],
                  ),
                ),

                // FAQ items
                ...faqs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final faq = entry.value;
                  return _buildFAQItem(context, faq, index, screenWidth);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, FAQData faq, int index, double screenWidth) {
    final isMobile = screenWidth < 640;
    
    return HoverableFAQCard(
      gradient: faq.gradient,
      child: Container(
        margin: EdgeInsets.only(bottom: isMobile ? 12 : 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 20,
              vertical: isMobile ? 8 : 12,
            ),
            childrenPadding: EdgeInsets.fromLTRB(
              isMobile ? 16 : 20,
              0,
              isMobile ? 16 : 20,
              isMobile ? 16 : 20,
            ),
            leading: Container(
              width: isMobile ? 40 : 48,
              height: isMobile ? 40 : 48,
              decoration: BoxDecoration(
                gradient: faq.gradient,
                borderRadius: BorderRadius.circular(isMobile ? 10 : 12),
              ),
              child: Icon(
                faq.icon,
                color: Colors.white,
                size: isMobile ? 20 : 24,
              ),
            ),
            title: Text(
              faq.question,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: isMobile ? 15 : 17,
              ),
            ),
            iconColor: Theme.of(context).colorScheme.primary,
            collapsedIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      faq.gradient.colors.first.withOpacity(0.05),
                      faq.gradient.colors.last.withOpacity(0.03),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  faq.answer,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.6,
                    fontSize: isMobile ? 14 : 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverableFAQCard extends StatefulWidget {
  final Widget child;
  final LinearGradient gradient;

  const HoverableFAQCard({
    super.key,
    required this.child,
    required this.gradient,
  });

  @override
  State<HoverableFAQCard> createState() => _HoverableFAQCardState();
}

class _HoverableFAQCardState extends State<HoverableFAQCard> {
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
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: _isHovered
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: widget.gradient.colors.first.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: widget.gradient.colors.last.withOpacity(0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
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

class FAQData {
  final String question;
  final String answer;
  final IconData icon;
  final LinearGradient gradient;

  const FAQData({
    required this.question,
    required this.answer,
    required this.icon,
    required this.gradient,
  });
}
