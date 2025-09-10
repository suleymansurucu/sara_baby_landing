import 'package:flutter/material.dart';
import 'max_width.dart';
import '../../domain/entities/faq_item.dart';

class FAQSection extends StatelessWidget {
  final List<FAQItem> faqItems;
  
  const FAQSection({super.key, required this.faqItems});

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
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Find answers to common questions about Sara Baby Tracker.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            ...faqItems.map((faq) => _buildFAQItem(context, faq)),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, FAQItem faq) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            title: Text(
              faq.question,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            children: [
              Text(
                faq.answer,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
