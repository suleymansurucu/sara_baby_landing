import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      ('Is it free?', 'Yes. The app and this landing site are open-source.'),
      ('Does it work offline?', 'Core tracking works offline; data syncs when back online.'),
      ('How about privacy?', 'We follow best practices; no selling of personal data. See our repo for details.'),
      ('Can I contribute?', 'Absolutely. Check GitHub issues and CONTRIBUTING.md to get started.'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FAQ', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            ...faqs.map((f) => Card(
              elevation: 0,
              child: ExpansionTile(
                title: Text(f.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                children: [Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,16),
                  child: Align(alignment: Alignment.centerLeft, child: Text(f.$2)),
                )],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
