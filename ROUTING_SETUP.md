# Routing Setup for Sara Baby Landing Page

This document explains the routing structure and deployment setup for the Sara Baby landing page.

## 🏗️ Architecture Overview

The app uses a multi-page structure with proper routing for web deployment:

- **Landing Page** (`/`) - Main homepage
- **Privacy Policy** (`/privacy-policy`) - Privacy policy page
- **Terms of Service** (`/terms-of-service`) - Terms of service page

## 📁 File Structure

```
lib/
├── constants/
│   └── app_routes.dart          # Route definitions
├── services/
│   ├── route_service.dart       # Centralized route management
│   └── deep_link_service.dart   # Deep linking and URL handling
└── presentation/
    └── widgets/
        └── route_guard.dart     # Route validation and navigation
```

## 🔧 Key Components

### 1. AppRoutes (`lib/constants/app_routes.dart`)
Defines all available routes in the application:
```dart
class AppRoutes {
  static const String home = '/';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsOfService = '/terms-of-service';
}
```

### 2. RouteService (`lib/services/route_service.dart`)
- Centralized route management
- Route validation
- Error handling for invalid routes
- Navigation helpers
- Deep link processing

### 3. DeepLinkService (`lib/services/deep_link_service.dart`)
- Browser URL handling
- History management
- Query parameter processing
- External link handling
- Share functionality

### 4. RouteGuard (`lib/presentation/widgets/route_guard.dart`)
- Route validation widget
- Navigation mixin for easy route handling
- Automatic redirects for invalid routes

## 🌐 Firebase Hosting Configuration

The `firebase.json` is configured with:

```json
{
  "hosting": {
    "public": "build/web",
    "rewrites": [
      {
        "source": "/privacy-policy",
        "destination": "/index.html"
      },
      {
        "source": "/terms-of-service", 
        "destination": "/index.html"
      },
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "public, max-age=31536000, immutable"
          }
        ]
      }
    ],
    "cleanUrls": true,
    "trailingSlash": false
  }
}
```

## 🚀 Deployment

### Manual Deployment
```bash
# Build the app
flutter build web --release

# Deploy to Firebase
firebase deploy --only hosting
```

### Using the Deployment Script
```bash
# Make script executable (Linux/Mac)
chmod +x deploy.sh

# Run deployment
./deploy.sh
```

## 🧪 Testing Routes

### Valid Routes
- `/` - Home page
- `/privacy-policy` - Privacy policy
- `/terms-of-service` - Terms of service

### Deep Link Variations
- `/privacy` → redirects to `/privacy-policy`
- `/terms` → redirects to `/terms-of-service`
- `/tos` → redirects to `/terms-of-service`

### Invalid Routes
- Any invalid route redirects to home page
- 404.html provides fallback with auto-redirect

## 🔍 Route Validation

The app includes comprehensive route validation:

1. **Client-side validation** - RouteService validates all routes
2. **Server-side fallback** - Firebase rewrites handle unknown routes
3. **Error handling** - Invalid routes redirect to home
4. **Deep link support** - URL variations are handled automatically

## 📱 PWA Support

The app is configured as a Progressive Web App with:
- Proper manifest.json
- Service worker support
- Offline capabilities
- App-like navigation

## 🛠️ Development

### Adding New Routes

1. Add route to `AppRoutes` class
2. Add route handler to `RouteService`
3. Create the page widget
4. Update Firebase rewrites if needed
5. Test the route

### Route Navigation

Use the `RouteHandlerMixin` for easy navigation:

```dart
class MyPage extends StatefulWidget {
  // ...
}

class _MyPageState extends State<MyPage> with RouteHandlerMixin {
  void _navigateToPrivacy() {
    navigateToPrivacyPolicy();
  }
  
  void _goHome() {
    navigateToHome();
  }
}
```

## 🔧 Troubleshooting

### Common Issues

1. **Routes not working after deployment**
   - Check Firebase rewrites configuration
   - Verify build output in `build/web`
   - Test with `firebase serve` locally

2. **404 errors on direct URL access**
   - Ensure Firebase rewrites are configured
   - Check that all routes are in `firebase.json`

3. **Navigation not updating URL**
   - Verify DeepLinkService is initialized
   - Check browser console for errors

### Debug Mode

Enable debug logging by setting:
```dart
// In main.dart
debugPrint('Current route: ${DeepLinkService.getCurrentRoute()}');
```

## 📊 Performance

The routing setup is optimized for:
- Fast initial load
- Efficient navigation
- Proper caching
- SEO-friendly URLs
- Mobile performance

## 🔒 Security

- All routes are validated
- Invalid routes redirect safely
- No sensitive data in URLs
- Proper error handling
- XSS protection through Flutter's built-in security
