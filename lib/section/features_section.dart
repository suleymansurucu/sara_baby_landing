import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Feeding Tracker', 'Breastfeeding (left/right), bottle (ml/oz), and pumping — quick entry with smart defaults.'),
      ('Sleep Tracker', 'One-tap start/stop, relaxing sounds, daily/weekly duration insights.'),
      ('Diaper Log', 'Wet / Dirty / Mixed with shortcuts and editable history.'),
      ('Growth & Milestones', 'Monthly checklist (multi-language), weight/height tracking with trends.'),
      ('Teething & Vaccination', 'Simple timeline to record dates, notes, and reminders.'),
      ('Open-Source Quality', 'Flutter + clean architecture, tests, CI/CD, and Firebase-ready.'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Features', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPhone(context) ? 1 : isTablet(context) ? 2 : 3,
                crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 4/3,
              ),
              itemCount: items.length,
              itemBuilder: (_, i) {
                final it = items[i];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, size: 28, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 12),
                        Text(it.$1, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                        const SizedBox(height: 8),
                        Text(it.$2),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
