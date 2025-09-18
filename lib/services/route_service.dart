import 'package:flutter/material.dart';
import '../constants/app_routes.dart';
import '../presentation/pages/landing_page.dart';
import '../presentation/pages/privacy_policy_page.dart';
import '../presentation/pages/terms_of_service_page.dart';

class RouteService {
  RouteService._(); // Private constructor to prevent instantiation

  /// Generate routes for the application
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const LandingPage(),
        AppRoutes.privacyPolicy: (context) => const PrivacyPolicyPage(),
        AppRoutes.termsOfService: (context) => const TermsOfServicePage(),
      };

  /// Generate route on the fly for dynamic routing
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
          settings: settings,
        );
      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyPage(),
          settings: settings,
        );
      case AppRoutes.termsOfService:
        return MaterialPageRoute(
          builder: (context) => const TermsOfServicePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => _buildNotFoundPage(settings.name ?? ''),
          settings: settings,
        );
    }
  }

  /// Build a 404 not found page
  static Widget _buildNotFoundPage(String routeName) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'The page "$routeName" does not exist.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to home page
                // This will be handled by the calling context
              },
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }

  /// Check if a route is valid
  static bool isValidRoute(String routeName) {
    return [
      AppRoutes.home,
      AppRoutes.privacyPolicy,
      AppRoutes.termsOfService,
    ].contains(routeName);
  }

  /// Get all available routes
  static List<String> get availableRoutes => [
        AppRoutes.home,
        AppRoutes.privacyPolicy,
        AppRoutes.termsOfService,
      ];

  /// Navigate to a route with error handling
  static Future<void> navigateToRoute(
    BuildContext context,
    String routeName, {
    bool replace = false,
  }) async {
    if (!isValidRoute(routeName)) {
      // Log the invalid route attempt
      debugPrint('Invalid route attempted: $routeName');
      // Navigate to home instead
      routeName = AppRoutes.home;
    }

    if (replace) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pushNamed(context, routeName);
    }
  }

  /// Handle deep linking
  static String handleDeepLink(String path) {
    // Remove leading slash if present
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    
    // Remove trailing slash if present
    if (path.endsWith('/')) {
      path = path.substring(0, path.length - 1);
    }

    // Handle empty path
    if (path.isEmpty) {
      return AppRoutes.home;
    }

    // Map common variations to our routes
    switch (path.toLowerCase()) {
      case 'privacy':
      case 'privacy-policy':
        return AppRoutes.privacyPolicy;
      case 'terms':
      case 'terms-of-service':
      case 'tos':
        return AppRoutes.termsOfService;
      case 'home':
      case 'index':
        return AppRoutes.home;
      default:
        // Check if it's a valid route
        if (isValidRoute('/$path')) {
          return '/$path';
        }
        // Return home for unknown routes
        return AppRoutes.home;
    }
  }
}
