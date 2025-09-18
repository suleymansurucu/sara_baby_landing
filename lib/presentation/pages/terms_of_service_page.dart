import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/generated/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../widgets/max_width.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(bottom: BorderSide(color: Colors.black.withValues(alpha: .06))),
          ),
          child: MaxWidth(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logos/sara_baby_logo.png',
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              final screenWidth = MediaQuery.of(context).size.width;
                              double fontSize = 18.0;
                              
                              if (screenWidth < 600) {
                                fontSize = 14.0;
                              } else if (screenWidth < 800) {
                                fontSize = 16.0;
                              } else if (screenWidth < 1000) {
                                fontSize = 17.0;
                              }
                              
                              return Text(
                                AppLocalizations.of(context)!.appTitleHeader,
                                style: GoogleFonts.poppins(
                                  fontSize: fontSize,
                                  color: Theme.of(context).colorScheme.primary,
                                  letterSpacing: -0.3,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isPhone(context)) ...[
                  TextButton(
                    onPressed: () => context.go('/'),
                    child: Text(AppLocalizations.of(context)!.homeNavigation, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () => context.go('/'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(AppLocalizations.of(context)!.getTheAppButton, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  ),
                ],
                if (isPhone(context))
                  Builder(
                    builder: (ctx) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: isPhone(context)
          ? Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logos/sara_baby_logo.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.appTitleHeader,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  _buildMenuItem(
                    context,
                    AppLocalizations.of(context)!.homeNavigation,
                    Icons.home_outlined,
                    () { Navigator.pop(context); context.go('/'); },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                      onPressed: () { Navigator.pop(context); context.go('/'); },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.download, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.getTheAppButton,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    Theme.of(context).colorScheme.secondary.withValues(alpha: 0.05),
                    Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: MaxWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logos/sara_baby_logo.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.termsOfServiceTitle,
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: -1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.lastUpdated,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Content Section
            MaxWidth(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntroSection(context),
                    const SizedBox(height: 40),
                    _buildSection(context, '1. Acceptance of Terms', _getAcceptanceOfTerms()),
                    const SizedBox(height: 40),
                    _buildSection(context, '2. Description of Service', _getDescriptionOfService()),
                    const SizedBox(height: 40),
                    _buildSection(context, '3. User Accounts and Data', _getUserAccountsAndData()),
                    const SizedBox(height: 40),
                    _buildSection(context, '4. Acceptable Use', _getAcceptableUse()),
                    const SizedBox(height: 40),
                    _buildSection(context, '5. Privacy and Data Protection', _getPrivacyAndDataProtection()),
                    const SizedBox(height: 40),
                    _buildSection(context, '6. Intellectual Property', _getIntellectualProperty()),
                    const SizedBox(height: 40),
                    _buildSection(context, '7. Disclaimers and Limitations', _getDisclaimersAndLimitations()),
                    const SizedBox(height: 40),
                    _buildSection(context, '8. Termination', _getTermination()),
                    const SizedBox(height: 40),
                    _buildSection(context, '9. Changes to Terms', _getChangesToTerms()),
                    const SizedBox(height: 40),
                    _buildContactSection(context),
                  ],
                ),
              ),
            ),
            
            // Footer
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                border: Border(top: BorderSide(color: Colors.black.withValues(alpha: .06))),
              ),
              child: MaxWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logos/sara_baby_logo.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.appTitleHeader,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.madeWithLove,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.termsWelcome,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.6,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.contactInformation,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.contactDescription,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.contactEmail,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getAcceptanceOfTerms() {
    return '''By accessing or using Sara Baby Tracker & Sounds, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this App.

These Terms apply to all users of the App, including without limitation users who are browsers, parents, caregivers, or contributors of content.''';
  }

  String _getDescriptionOfService() {
    return '''Sara Baby Tracker & Sounds is a mobile application designed to help parents and caregivers track their baby's activities, growth, and development. The App provides features including:

• Activity tracking (feeding, sleeping, diaper changes, etc.)
• Growth monitoring and charts
• Sound library for soothing babies
• Family sharing capabilities
• Data export functionality
• Sleep pattern analysis

The App is developed and maintained by FlutterGoo, an open-source community project.''';
  }

  String _getUserAccountsAndData() {
    return '''• Account Creation: You may create an account to sync your data across devices. You are responsible for maintaining the confidentiality of your account credentials.

• Data Ownership: You retain ownership of all data you input into the App. We do not claim ownership of your personal information or baby tracking data.

• Data Storage: Your data may be stored locally on your device or in secure cloud storage (Firebase) if you choose to create an account.

• Data Accuracy: You are responsible for the accuracy of information you provide. We are not liable for any consequences resulting from inaccurate data entry.''';
  }

  String _getAcceptableUse() {
    return '''You agree to use the App only for lawful purposes and in accordance with these Terms. You agree not to:

• Use the App for any illegal or unauthorized purpose
• Attempt to gain unauthorized access to any part of the App
• Interfere with or disrupt the App's functionality
• Upload or transmit any harmful code, viruses, or malicious software
• Use the App to harass, abuse, or harm others
• Violate any applicable laws or regulations

The App is intended for use by parents and caregivers only. It is not designed for use by children under 13 years of age.''';
  }

  String _getPrivacyAndDataProtection() {
    return '''Your privacy is important to us. Our collection and use of personal information is governed by our Privacy Policy, which is incorporated into these Terms by reference.

Key privacy principles:
• We collect minimal data necessary to provide the service
• Your baby tracking data is stored securely
• We do not sell or share your personal information with third parties
• You can delete your data at any time by uninstalling the App
• We use industry-standard security measures to protect your information

Please review our Privacy Policy for detailed information about our data practices.''';
  }

  String _getIntellectualProperty() {
    return '''• App Ownership: The App and its original content, features, and functionality are owned by FlutterGoo and are protected by international copyright, trademark, and other intellectual property laws.

• Open Source: This App is released under an open-source license. The source code is available on GitHub at https://github.com/fluttergoo/open_baby_sara

• User Content: You retain ownership of any content you create or upload to the App. By using the App, you grant us a limited license to store and process your data to provide the service.

• Third-Party Content: The App may include third-party content or services. Such content is subject to the respective third parties' terms and conditions.''';
  }

  String _getDisclaimersAndLimitations() {
    return '''• Medical Disclaimer: This App is for informational and tracking purposes only. It is not intended to replace professional medical advice, diagnosis, or treatment. Always consult with qualified healthcare professionals regarding your baby's health and development.

• Service Availability: We strive to maintain the App's availability but cannot guarantee uninterrupted service. The App may be temporarily unavailable due to maintenance, updates, or technical issues.

• Limitation of Liability: To the maximum extent permitted by law, FlutterGoo shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of the App.

• No Warranties: The App is provided "as is" without warranties of any kind, either express or implied.''';
  }

  String _getTermination() {
    return '''• Termination by You: You may stop using the App at any time by uninstalling it from your device. You may also delete your account and associated data through the App settings.

• Termination by Us: We reserve the right to terminate or suspend your access to the App at any time, with or without notice, for any reason, including violation of these Terms.

• Effect of Termination: Upon termination, your right to use the App will cease immediately. We may delete your account and associated data, though some data may be retained as required by law or for legitimate business purposes.''';
  }

  String _getChangesToTerms() {
    return '''We reserve the right to modify these Terms at any time. We will notify users of any material changes by:

• Posting the updated Terms on our website
• Updating the "Last Updated" date at the top of these Terms
• Sending a notification through the App (if applicable)

Your continued use of the App after any changes constitutes acceptance of the new Terms. If you do not agree to the modified Terms, you should discontinue use of the App.''';
  }
}

bool isPhone(BuildContext context) {
  return MediaQuery.of(context).size.width < 768;
}
