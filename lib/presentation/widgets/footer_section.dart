import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'max_width.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: MaxWidth(
        child: Column(
          children: [
            // Main content section
            if (isMobile) 
              ..._buildMobileLayout(context)
            else 
              ..._buildDesktopLayout(context),

            const SizedBox(height: 48),

            // Divider
            Divider(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              thickness: 1,
            ),

            const SizedBox(height: 32),

            // Bottom section with copyright and legal links
            if (isMobile)
              _buildMobileBottom(context)
            else
              _buildDesktopBottom(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMobileLayout(BuildContext context) {
    return [
      // App logo and description
      Column(
        children: [
          Image.asset(
            'assets/logos/sara_baby_logo.png',
            height: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            'Sara Baby Tracker & Sounds',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'The ultimate companion for new parents. Track your baby\'s activities, growth, and sleep patterns with ease.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),

      const SizedBox(height: 32),

      // Download section
      _buildDownloadSection(context, isMobile: true),

      const SizedBox(height: 32),

      // Features section
      _buildFeaturesSection(context, isMobile: true),

      const SizedBox(height: 32),

      // Support section
      _buildSupportSection(context, isMobile: true),

      const SizedBox(height: 32),

      // Social links
      _buildSocialLinks(context, isMobile: true),
    ];
  }

  List<Widget> _buildDesktopLayout(BuildContext context) {
    return [
      // Top section with logo and description
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side - App info
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logos/sara_baby_logo.png',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sara Baby Tracker & Sounds',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'The ultimate companion for new parents',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Track your baby\'s activities, growth, and sleep patterns with ease. Built with love for parents who want the best for their little ones.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          // Right side - Download badges
          Expanded(
            flex: 2,
            child: _buildDownloadSection(context, isMobile: false),
          ),
        ],
      ),

      const SizedBox(height: 48),

      // Middle section with features and support
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Features section
          Expanded(
            flex: 2,
            child: _buildFeaturesSection(context, isMobile: false),
          ),
          const SizedBox(width: 48),
          // Support section
          Expanded(
            flex: 2,
            child: _buildSupportSection(context, isMobile: false),
          ),
          const SizedBox(width: 48),
          // Social links
          Expanded(
            flex: 1,
            child: _buildSocialLinks(context, isMobile: false),
          ),
        ],
      ),
    ];
  }

  Widget _buildDownloadSection(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Download Now',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            InkWell(
              onTap: () => launchUrl(Uri.parse('https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938')),
              child: Image.asset(
                'assets/logos/appstore_badge.png',
                height: isMobile ? 40 : 48,
                fit: BoxFit.contain,
              ),
            ),
            InkWell(
              onTap: () => launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy')),
              child: Image.asset(
                'assets/logos/googleplay_badge.png',
                height: isMobile ? 40 : 48,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildFeatureList(context, isMobile: isMobile),
      ],
    );
  }

  List<Widget> _buildFeatureList(BuildContext context, {required bool isMobile}) {
    final features = [
      'Activity Tracking',
      'Sleep Monitoring',
      'Growth Charts',
      'Sound Library',
      'Family Sharing',
      'Data Export',
    ];

    return features.map((feature) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            feature,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    )).toList();
  }

  Widget _buildSupportSection(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Support & Resources',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildSupportLinks(context, isMobile: isMobile),
      ],
    );
  }

  List<Widget> _buildSupportLinks(BuildContext context, {required bool isMobile}) {
    return [
      _buildLinkButton(
        context,
        'GitHub Repository',
        Icons.code,
        'https://github.com/fluttergoo/open_baby_sara',
        isMobile: isMobile,
      ),
      const SizedBox(height: 8),
      _buildLinkButton(
        context,
        'Report Issues',
        Icons.bug_report,
        'https://github.com/fluttergoo/open_baby_sara/issues',
        isMobile: isMobile,
      ),
      const SizedBox(height: 8),
      _buildLinkButton(
        context,
        'Feature Requests',
        Icons.lightbulb,
        'https://github.com/fluttergoo/open_baby_sara/discussions',
        isMobile: isMobile,
      ),
      const SizedBox(height: 8),
      _buildLinkButton(
        context,
        'Documentation',
        Icons.help,
        'https://github.com/fluttergoo/open_baby_sara/wiki',
        isMobile: isMobile,
      ),
    ];
  }

  Widget _buildSocialLinks(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Connect With Us',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ..._buildSocialButtons(context, isMobile: isMobile),
      ],
    );
  }

  List<Widget> _buildSocialButtons(BuildContext context, {required bool isMobile}) {
    return [
      _buildLinkButton(
        context,
        'Community Founder',
        Icons.person,
        'https://github.com/fluttergoo',
        isMobile: isMobile,
      ),
      const SizedBox(height: 8),
      _buildLinkButton(
        context,
        'LinkedIn',
        Icons.work,
        'https://www.linkedin.com/in/suleymansurucu/',
        isMobile: isMobile,
      ),
      const SizedBox(height: 8),
      _buildLinkButton(
        context,
        'Email',
        Icons.email,
        'mailto:suleymansurucu95@gmail.com',
        isMobile: isMobile,
      ),
    ];
  }

  Widget _buildLinkButton(
    BuildContext context,
    String text,
    IconData icon,
    String url, {
    required bool isMobile,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileBottom(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© ${DateTime.now().year} Sara Baby Tracker & Sounds — ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            InkWell(
              onTap: () => launchUrl(Uri.parse('https://github.com/fluttergoo/open_baby_sara')),
              child: Text(
                'Community',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/privacy-policy'),
              child: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/terms-of-service'),
              child: Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopBottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                '© ${DateTime.now().year} Sara Baby Tracker & Sounds — ',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              InkWell(
                onTap: () => launchUrl(Uri.parse('https://github.com/fluttergoo/open_baby_sara')),
                child: Text(
                  'Community',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/privacy-policy'),
              child: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/terms-of-service'),
              child: Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
