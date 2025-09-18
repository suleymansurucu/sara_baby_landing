import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/max_width.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(bottom: BorderSide(color: Colors.black.withOpacity(.06))),
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
                                color: Colors.black.withOpacity(0.1),
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
                                'Sara Baby Tracker & Sounds',
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
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    child: Text('Home', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Get the App', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
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
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
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
                              color: Colors.black.withOpacity(0.1),
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
                        'Sara Baby Tracker & Sounds',
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
                    'Home',
                    Icons.home_outlined,
                    () { Navigator.pop(context); Navigator.pushNamed(context, '/'); },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FilledButton(
                      onPressed: () { Navigator.pop(context); Navigator.pushNamed(context, '/'); },
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
                            'Get the App',
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
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.05),
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
                              color: Colors.black.withOpacity(0.1),
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
                        'Privacy Policy',
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
                        'Last Updated: September 17, 2025',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
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
                    _buildSection(context, '1. Information We Collect', _getInformationWeCollect()),
                    const SizedBox(height: 40),
                    _buildSection(context, '2. How We Use Information', _getHowWeUseInformation()),
                    const SizedBox(height: 40),
                    _buildSection(context, '3. Data Storage and Security', _getDataStorageAndSecurity()),
                    const SizedBox(height: 40),
                    _buildSection(context, '4. Third-Party Services', _getThirdPartyServices()),
                    const SizedBox(height: 40),
                    _buildSection(context, '5. Children\'s Privacy', _getChildrensPrivacy()),
                    const SizedBox(height: 40),
                    _buildSection(context, '6. Your Rights', _getYourRights()),
                    const SizedBox(height: 40),
                    _buildSection(context, '7. Changes to This Policy', _getChangesToPolicy()),
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
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                border: Border(top: BorderSide(color: Colors.black.withOpacity(.06))),
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
                              color: Colors.black.withOpacity(0.1),
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
                        'Sara Baby Tracker & Sounds',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Made with ❤️ by FlutterGoo',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
        hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sara Baby Tracker & Sounds ("the App") is developed and maintained by FlutterGoo, an open-source community project. We are committed to protecting your privacy and ensuring transparency about how your data is handled.',
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
        color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '8. Contact Us',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'If you have any questions or concerns about this Privacy Policy, you can reach us at:',
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
                'fluttergoo@gmail.com',
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

  String _getInformationWeCollect() {
    return '''The App is designed for parents and caregivers to track baby activities. Depending on your use, we may collect:

• Baby Profile Data: Name, date of birth, gender, and optional photo (stored locally on your device).

• Activity Records: Feeding times, sleep tracking, diaper changes, milestones, and other activity logs (stored securely on your device or optionally synced with your chosen account if enabled).

• Authentication Data (if enabled): Email and password when creating an account. This is managed securely through Firebase Authentication.

• Crash and Usage Analytics: Anonymous usage data may be collected via Firebase to help us improve performance and stability.''';
  }

  String _getHowWeUseInformation() {
    return '''We use your information solely to:

• Provide baby activity tracking and related app features.

• Improve app stability, performance, and user experience.

• Store your data securely, either locally on your device or in the cloud (if you sign in).

We do not sell, rent, or trade your personal information to third parties.''';
  }

  String _getDataStorageAndSecurity() {
    return '''• Local Storage: By default, baby photos and activities are stored only on your device.

• Cloud Storage (Optional): If you sign in, your data may be synced securely to Firebase Cloud Firestore.

• Security Measures: We use industry-standard practices such as encryption and secure authentication to protect your information.''';
  }

  String _getThirdPartyServices() {
    return '''The App may use the following trusted services:

• Firebase Authentication & Firestore (for secure login and cloud sync).

• Firebase Analytics / Crashlytics (for anonymous performance and error reporting).

These services have their own privacy policies, which we encourage you to review:

Firebase Privacy Policy''';
  }

  String _getChildrensPrivacy() {
    return '''The App is intended for parents and caregivers, not children. We do not knowingly collect personal information from children under 13. If we discover that we have inadvertently collected such data, we will delete it immediately.''';
  }

  String _getYourRights() {
    return '''Depending on your location, you may have the right to:

• Access or export your data.

• Request correction or deletion of your information.

• Withdraw consent and stop using the App at any time.

You can delete all app data directly by uninstalling the App.''';
  }

  String _getChangesToPolicy() {
    return '''We may update this Privacy Policy from time to time. Any changes will be posted at:
https://sarababy.app/privacy-policy/''';
  }
}

bool isPhone(BuildContext context) {
  return MediaQuery.of(context).size.width < 768;
}
