# 🍼 Sara Baby Tracker & Sounds – Landing Page

<div align="center">

<img src="assets/logos/sara_baby_logo.png" alt="Sara Baby Logo" width="80" height="80">

**A beautiful, responsive landing page for the Sara Baby Tracker & Sounds mobile app**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Web](https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://web.dev/)

</div>

## 📱 About Sara Baby

Sara Baby Tracker & Sounds is an open-source mobile application designed to help parents track their baby's activities, growth, and provide soothing sounds for better sleep. This landing page showcases the app's features and provides download links for both iOS and Android platforms.

## ✨ Features

### 🌍 **Multi-language Support**
- **11 Languages**: English, Turkish, Arabic, German, Spanish, French, Indonesian, Korean, Dutch, Russian, Chinese
- **Dynamic Language Switching**: Real-time language changes without page reload
- **Localized Content**: All text, dates, and cultural elements properly localized

### 🎨 **Modern Design**
- **Responsive Layout**: Optimized for desktop, tablet, and mobile devices
- **Material Design 3**: Following Google's latest design guidelines
- **Smooth Animations**: Elegant transitions and scroll animations
- **Dark/Light Theme**: Automatic theme adaptation based on user preferences

### 📱 **App Showcase**
- **Feature Highlights**: Interactive sections showcasing app capabilities
- **Screenshot Gallery**: High-quality app screenshots with smooth transitions
- **Download Links**: Direct links to App Store and Google Play
- **FAQ Section**: Comprehensive answers to common questions

### 🚀 **Performance Optimized**
- **Fast Loading**: Optimized assets and efficient rendering
- **SEO Friendly**: Meta tags, structured data, and sitemap
- **PWA Ready**: Progressive Web App capabilities
- **Firebase Hosting**: Global CDN for fast content delivery

## 🛠️ Tech Stack

- **Frontend**: Flutter Web
- **Hosting**: Firebase Hosting
- **Fonts**: Google Fonts (Inter, Poppins)
- **Icons**: Material Icons, Custom SVG icons
- **Localization**: Flutter Intl
- **Deployment**: Automated CI/CD with bash scripts

## 📁 Project Structure

```
sara_baby_landing/
├── lib/
│   ├── constants/          # App colors, routes
│   ├── data/              # Models, repositories
│   ├── domain/            # Entities, use cases
│   ├── generated/         # Auto-generated localization files
│   ├── l10n/             # Localization source files (.arb)
│   ├── presentation/      # UI components, pages, controllers
│   └── services/          # Deep linking, routing, SEO services
├── assets/
│   ├── images/           # App screenshots and feature images
│   └── logos/            # App logos and store badges
├── web/                  # Web-specific files
├── firebase.json         # Firebase configuration
└── deploy.sh            # Deployment script
```

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** (>=3.8.1)
- **Firebase CLI** (for deployment)
- **Git** (for version control)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/sara_baby_landing.git
   cd sara_baby_landing
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate localization files**
   ```bash
   flutter gen-l10n
   ```

4. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

### 🏗️ Building for Production

1. **Build the web app**
   ```bash
   flutter build web --release
   ```

2. **Deploy to Firebase** (using the provided script)
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

## 🌍 Localization

The project supports 11 languages with comprehensive localization:

| Language | Code | Status |
|----------|------|--------|
| English | `en` | ✅ Complete |
| Turkish | `tr` | ✅ Complete |
| Arabic | `ar` | ✅ Complete |
| German | `de` | ✅ Complete |
| Spanish | `es` | ✅ Complete |
| French | `fr` | ✅ Complete |
| Indonesian | `id` | ✅ Complete |
| Korean | `ko` | ✅ Complete |
| Dutch | `nl` | ✅ Complete |
| Russian | `ru` | ✅ Complete |
| Chinese | `zh` | ✅ Complete |

### Adding New Languages

1. Create a new `.arb` file in `lib/l10n/`
2. Add the locale to `LanguageService.supportedLocales`
3. Run `flutter gen-l10n` to generate the localization files

## 🎨 Customization

### Colors
Edit `lib/constants/app_colors.dart` to customize the app's color scheme.

### Content
- **App Info**: Update `lib/data/repositories/app_info_repository.dart`
- **Features**: Modify `lib/data/repositories/feature_repository.dart`
- **FAQ**: Edit `lib/data/repositories/faq_repository.dart`

### Assets
- Replace images in `assets/images/` and `assets/logos/`
- Update `pubspec.yaml` if adding new asset directories

## 📱 App Store Links

- **iOS App Store**: [Download on the App Store](https://apps.apple.com/app/sara-baby-tracker-sounds/id123456789)
- **Google Play Store**: [Get it on Google Play](https://play.google.com/store/apps/details?id=com.sarababy.tracker)

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### Development Guidelines

- Follow Flutter/Dart style guidelines
- Add tests for new features
- Update documentation as needed
- Ensure all localizations are updated

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team** for the amazing framework
- **Firebase** for hosting and services
- **Google Fonts** for beautiful typography
- **Material Design** for design guidelines

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/your-username/sara_baby_landing/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-username/sara_baby_landing/discussions)
- **Email**: support@sarababy.app

---

<div align="center">

**Made with ❤️ for parents and their little ones**

[🌐 Live Demo](https://your-firebase-project.web.app) | [📱 Download App](https://sarababy.app) | [🐛 Report Bug](https://github.com/your-username/sara_baby_landing/issues)

</div>
