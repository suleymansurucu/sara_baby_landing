import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';
import 'package:url_launcher/url_launcher.dart';



class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: isPhone(context) ? 40 : 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF6C63FF), Color(0xFF8E80FF)],
            begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All-in-one baby care:\nTrack, Feed, Sleep, and Grow Together.',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white, height: 1.1, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              'Open-source Flutter app to help parents track daily baby activities and create a calm environment with sleep sounds & recipes.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(.95)),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12, runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // App Store (SVG)
                InkWell(
                  onTap: () => launchUrl(Uri.parse('https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938')),
                  child: Image.asset(
                    'assets/logos/appstore_badge.png',
                    height: 44,
                    fit: BoxFit.contain,
                      ),
                ),
                // Google Play (PNG)
                InkWell(
                  onTap: () => launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.suleymansurucu.sarab')),
                  child: Image.asset(
                    'assets/logos/googleplay_badge.png',
                    height: 48,
                    fit: BoxFit.contain,
                  ),
                ),
                // Open Source link (opsiyonel üçüncü CTA)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () => launchUrl(Uri.parse('https://github.com/fluttergoo/open_baby_sara')),
                  child: const Text('GitHub (Open Source)'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
