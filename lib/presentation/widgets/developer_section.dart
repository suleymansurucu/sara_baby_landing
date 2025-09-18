import 'package:flutter/material.dart';
import 'package:untitled/generated/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'max_width.dart';

class DeveloperSection extends StatelessWidget {
  const DeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Open source message
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                AppLocalizations.of(context)!.developerTitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.developerDescription,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Developer card
            Card(
              elevation: 4,
              shadowColor: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Avatar placeholder (circle with developer icon)
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Community name
                    Text(
                      AppLocalizations.of(context)!.developerCommunity,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Community name
                    Text(
                      AppLocalizations.of(context)!.developerMission, textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Community description
                    Text(
                      AppLocalizations.of(context)!.developerAbout,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Contact buttons
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        // GitHub button
                        OutlinedButton.icon(
                          onPressed: () => launchUrl(Uri.parse('https://github.com/fluttergoo/open_baby_sara')),
                          icon: const Icon(Icons.code, size: 20),
                          label: Text(AppLocalizations.of(context)!.viewGitHub),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.primary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        // Community button
                        OutlinedButton.icon(
                          onPressed: () => launchUrl(Uri.parse('https://github.com/fluttergoo')),
                          icon: const Icon(Icons.group, size: 20),
                          label: Text(AppLocalizations.of(context)!.community),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.secondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        // Email button
                        OutlinedButton.icon(
                          onPressed: () => launchUrl(Uri.parse('mailto:fluttergoo@gmail.com')),
                          icon: const Icon(Icons.email, size: 20),
                          label: Text(AppLocalizations.of(context)!.email),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.tertiary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
