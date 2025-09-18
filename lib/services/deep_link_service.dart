import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'package:flutter/foundation.dart';
import '../constants/app_routes.dart';
import 'route_service.dart';

class DeepLinkService {
  DeepLinkService._(); // Private constructor to prevent instantiation

  /// Initialize deep link handling
  static void initialize() {
    if (kIsWeb) {
      _handleInitialRoute();
      _setupRouteListener();
    }
  }

  /// Handle the initial route when the app loads
  static void _handleInitialRoute() {
    final currentPath = web.window.location.pathname;
    final attemptedRoute = web.window.sessionStorage.getItem('attemptedRoute');
    
    if (attemptedRoute != null && attemptedRoute.isNotEmpty) {
      // Clear the stored route
      web.window.sessionStorage.removeItem('attemptedRoute');
      // Handle the attempted route
      _processRoute(attemptedRoute);
    } else if (currentPath != '/' && currentPath.isNotEmpty) {
      // Handle current path if it's not the root
      _processRoute(currentPath);
    }
  }

  /// Set up listener for route changes
  static void _setupRouteListener() {
    web.window.addEventListener('popstate', ((web.Event event) {
      final currentPath = web.window.location.pathname;
      _processRoute(currentPath);
    }).toJS);
  }

  /// Process a route and navigate if valid
  static void _processRoute(String route) {
    final processedRoute = RouteService.handleDeepLink(route);
    
    if (processedRoute != AppRoutes.home) {
      // Update the URL without triggering a page reload
      web.window.history.replaceState(null, '', processedRoute);
    }
  }

  /// Navigate to a route and update the browser URL
  static void navigateToRoute(String route) {
    if (kIsWeb) {
      final processedRoute = RouteService.handleDeepLink(route);
      web.window.history.pushState(null, '', processedRoute);
    }
  }

  /// Get the current route from the browser
  static String getCurrentRoute() {
    if (kIsWeb) {
      return web.window.location.pathname;
    }
    return AppRoutes.home;
  }

  /// Check if the current route is valid
  static bool isCurrentRouteValid() {
    final currentRoute = getCurrentRoute();
    return RouteService.isValidRoute(currentRoute);
  }

  /// Handle external links
  static void openExternalLink(String url) {
    if (kIsWeb) {
      web.window.open(url, '_blank');
    }
  }

  /// Share the current page
  static void shareCurrentPage() {
    if (kIsWeb) {
      final currentUrl = web.window.location.href;
      try {
        final shareData = web.ShareData(
          title: 'Sara Baby Tracker & Sounds',
          text: 'Track every precious moment with Sara Baby. Complete baby care companion for sleep tracking, feeding schedules, growth monitoring, and soothing sounds.',
          url: currentUrl,
        );
        web.window.navigator.share(shareData);
      } catch (e) {
        // Fallback: copy to clipboard
        web.window.navigator.clipboard.writeText(currentUrl);
      }
    }
  }

  /// Get query parameters from the current URL
  static Map<String, String> getQueryParameters() {
    if (kIsWeb) {
      final uri = Uri.parse(web.window.location.href);
      return uri.queryParameters;
    }
    return {};
  }

  /// Update query parameters without reloading the page
  static void updateQueryParameters(Map<String, String> parameters) {
    if (kIsWeb) {
      final uri = Uri.parse(web.window.location.href);
      final newUri = uri.replace(queryParameters: parameters);
      web.window.history.replaceState(null, '', newUri.toString());
    }
  }

  /// Clear all query parameters
  static void clearQueryParameters() {
    if (kIsWeb) {
      final uri = Uri.parse(web.window.location.href);
      final newUri = uri.replace(queryParameters: {});
      web.window.history.replaceState(null, '', newUri.toString());
    }
  }
}
