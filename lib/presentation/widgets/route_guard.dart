import 'package:flutter/material.dart';
import '../../constants/app_routes.dart';
import '../../services/route_service.dart';
import '../../services/deep_link_service.dart';

class RouteGuard extends StatefulWidget {
  final Widget child;
  final String currentRoute;

  const RouteGuard({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<RouteGuard> createState() => _RouteGuardState();
}

class _RouteGuardState extends State<RouteGuard> {
  @override
  void initState() {
    super.initState();
    _validateRoute();
  }

  @override
  void didUpdateWidget(RouteGuard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      _validateRoute();
    }
  }

  void _validateRoute() {
    if (!RouteService.isValidRoute(widget.currentRoute)) {
      // Route is invalid, redirect to home
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// A widget that handles route navigation with proper URL updates
class RouteNavigator extends StatelessWidget {
  final Widget child;
  final String route;

  const RouteNavigator({
    super.key,
    required this.child,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return RouteGuard(
      currentRoute: route,
      child: child,
    );
  }
}

/// A mixin for widgets that need to handle route changes
mixin RouteHandlerMixin<T extends StatefulWidget> on State<T> {
  String get currentRoute => ModalRoute.of(context)?.settings.name ?? AppRoutes.home;

  void navigateToRoute(String route, {bool replace = false}) {
    DeepLinkService.navigateToRoute(route);
    
    if (replace) {
      Navigator.of(context).pushReplacementNamed(route);
    } else {
      Navigator.of(context).pushNamed(route);
    }
  }

  void navigateToHome() {
    navigateToRoute(AppRoutes.home, replace: true);
  }

  void navigateToPrivacyPolicy() {
    navigateToRoute(AppRoutes.privacyPolicy);
  }

  void navigateToTermsOfService() {
    navigateToRoute(AppRoutes.termsOfService);
  }

  void goBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      navigateToHome();
    }
  }

  bool canGoBack() {
    return Navigator.of(context).canPop();
  }
}
