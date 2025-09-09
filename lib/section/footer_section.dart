import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: MaxWidth(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 12,
          children: [
            Text('© ${DateTime.now().year} Sara Baby Tracker & Sounds — Open Source'),
            Wrap(
              spacing: 16,
              children: [
                TextButton(onPressed: () => launchUrl(Uri.parse('https://github.com/fluttergoo/open_baby_sara')), child: const Text('GitHub')),
                TextButton(onPressed: () => launchUrl(Uri.parse('mailto:suleyman.surucu1@gmail.com')), child: const Text('Contact')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
