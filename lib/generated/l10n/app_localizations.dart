import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('ar'),
    Locale('zh'),
    Locale('nl'),
    Locale('ru'),
    Locale('ko'),
    Locale('id'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Sara Baby Tracker & Sounds'**
  String get appTitle;

  /// Home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Features navigation item
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// Screens navigation item
  ///
  /// In en, this message translates to:
  /// **'Screens'**
  String get screens;

  /// Developer navigation item
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// FAQ navigation item
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// Get the app button text
  ///
  /// In en, this message translates to:
  /// **'Get the App'**
  String get getTheApp;

  /// Get started today text
  ///
  /// In en, this message translates to:
  /// **'Get Started Today'**
  String get getStartedToday;

  /// App Store button text
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get appStore;

  /// Google Play button text
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// Perfect rating text
  ///
  /// In en, this message translates to:
  /// **'Perfect Rating'**
  String get perfectRating;

  /// Number of parents using the app
  ///
  /// In en, this message translates to:
  /// **'1000+ Parents'**
  String get parentsCount;

  /// No ads feature text
  ///
  /// In en, this message translates to:
  /// **'No Ads'**
  String get noAds;

  /// Language selector label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Language selection dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Turkish language option
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get turkish;

  /// German language option
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get german;

  /// Spanish language option
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get spanish;

  /// French language option
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get french;

  /// Arabic language option
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// Chinese language option
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get chinese;

  /// Dutch language option
  ///
  /// In en, this message translates to:
  /// **'Nederlands'**
  String get dutch;

  /// Russian language option
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get russian;

  /// Korean language option
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get korean;

  /// Indonesian language option
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get indonesian;

  /// Error message when content fails to load
  ///
  /// In en, this message translates to:
  /// **'Error loading content: {error}'**
  String errorLoadingContent(String error);

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Download button text
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// FAQ section title
  ///
  /// In en, this message translates to:
  /// **'❓ FAQ'**
  String get faqTitle;

  /// FAQ section subtitle
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqSubtitle;

  /// FAQ section description
  ///
  /// In en, this message translates to:
  /// **'Find answers to common questions about Sara Baby Tracker.'**
  String get faqDescription;

  /// Developer section title
  ///
  /// In en, this message translates to:
  /// **'✨ Sara is fully open-source'**
  String get developerTitle;

  /// Developer section description
  ///
  /// In en, this message translates to:
  /// **'Explore the code, open issues, and contribute to make Sara even better.'**
  String get developerDescription;

  /// Developer community name
  ///
  /// In en, this message translates to:
  /// **'Flutter Goo Open Source Community'**
  String get developerCommunity;

  /// Developer mission statement
  ///
  /// In en, this message translates to:
  /// **'Building Modern Solutions for New Parents'**
  String get developerMission;

  /// Developer about text
  ///
  /// In en, this message translates to:
  /// **'We are a passionate open-source community dedicated to creating modern, intuitive, and accessible solutions for new parents. Our mission is to make parenting easier through innovative technology, clean design, and community-driven development. Join us in building tools that help families track, nurture, and celebrate every precious moment of their baby\'s journey.'**
  String get developerAbout;

  /// View GitHub button text
  ///
  /// In en, this message translates to:
  /// **'View GitHub'**
  String get viewGitHub;

  /// Community button text
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// Email button text
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Screenshots section title
  ///
  /// In en, this message translates to:
  /// **'📱 Screenshots'**
  String get screenshotsTitle;

  /// Screenshots section subtitle
  ///
  /// In en, this message translates to:
  /// **'See Sara in Action'**
  String get screenshotsSubtitle;

  /// Screenshots section description
  ///
  /// In en, this message translates to:
  /// **'Experience our beautifully designed interface that makes baby tracking simple and intuitive.'**
  String get screenshotsDescription;

  /// Swipe instruction text
  ///
  /// In en, this message translates to:
  /// **'Swipe'**
  String get swipe;

  /// Footer title
  ///
  /// In en, this message translates to:
  /// **'Sara Baby Tracker & Sounds'**
  String get footerTitle;

  /// Footer description
  ///
  /// In en, this message translates to:
  /// **'The ultimate companion for new parents. Track your baby\'s activities, growth, and sleep patterns with ease.'**
  String get footerDescription;

  /// Footer subtitle
  ///
  /// In en, this message translates to:
  /// **'The ultimate companion for new parents'**
  String get footerSubtitle;

  /// Footer about text
  ///
  /// In en, this message translates to:
  /// **'Track your baby\'s activities, growth, and sleep patterns with ease. Built with love for parents who want the best for their little ones.'**
  String get footerAbout;

  /// Download now button text
  ///
  /// In en, this message translates to:
  /// **'Download Now'**
  String get downloadNow;

  /// Key features section title
  ///
  /// In en, this message translates to:
  /// **'Key Features'**
  String get keyFeatures;

  /// Support and resources section title
  ///
  /// In en, this message translates to:
  /// **'Support & Resources'**
  String get supportResources;

  /// Connect with us section title
  ///
  /// In en, this message translates to:
  /// **'Connect With Us'**
  String get connectWithUs;

  /// Copyright text
  ///
  /// In en, this message translates to:
  /// **'© {year} Sara Baby Tracker & Sounds — '**
  String copyright(int year);

  /// Privacy Policy link text
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms of Service link text
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Features section title
  ///
  /// In en, this message translates to:
  /// **'✨ Features'**
  String get featuresTitle;

  /// Features section subtitle
  ///
  /// In en, this message translates to:
  /// **'Complete Baby Care Solution'**
  String get featuresSubtitle;

  /// Features section description
  ///
  /// In en, this message translates to:
  /// **'Everything you need to track your baby\'s development and create a nurturing environment.'**
  String get featuresDescription;

  /// Terms of Service page title
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfServiceTitle;

  /// Last updated date
  ///
  /// In en, this message translates to:
  /// **'Last Updated: September 17, 2025'**
  String get lastUpdated;

  /// Made with love text
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ by FlutterGoo'**
  String get madeWithLove;

  /// Terms of Service welcome text
  ///
  /// In en, this message translates to:
  /// **'Welcome to Sara Baby Tracker & Sounds (\"the App\"). These Terms of Service (\"Terms\") govern your use of our mobile application and related services. By downloading, installing, or using the App, you agree to be bound by these Terms.'**
  String get termsWelcome;

  /// Contact information section title
  ///
  /// In en, this message translates to:
  /// **'10. Contact Information'**
  String get contactInformation;

  /// Contact description text
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about these Terms of Service, please contact us:'**
  String get contactDescription;

  /// Contact email address
  ///
  /// In en, this message translates to:
  /// **'suleymansurucu95@gmail.com'**
  String get contactEmail;

  /// Privacy Policy page title
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyTitle;

  /// Privacy Policy welcome text
  ///
  /// In en, this message translates to:
  /// **'Sara Baby Tracker & Sounds (\"the App\") is developed and maintained by FlutterGoo, an open-source community project. We are committed to protecting your privacy and ensuring transparency about how your data is handled.'**
  String get privacyWelcome;

  /// Contact us section title
  ///
  /// In en, this message translates to:
  /// **'8. Contact Us'**
  String get contactUs;

  /// Privacy Policy contact description
  ///
  /// In en, this message translates to:
  /// **'If you have any questions or concerns about this Privacy Policy, you can reach us at:'**
  String get privacyContactDescription;

  /// Privacy Policy contact email
  ///
  /// In en, this message translates to:
  /// **'fluttergoo@gmail.com'**
  String get privacyContactEmail;

  /// Activity tracking feature title
  ///
  /// In en, this message translates to:
  /// **'Activity Tracking'**
  String get activityTracking;

  /// Activity tracking feature description
  ///
  /// In en, this message translates to:
  /// **'Intuitive interface for logging all baby activities'**
  String get activityTrackingDescription;

  /// History timeline feature title
  ///
  /// In en, this message translates to:
  /// **'History Timeline'**
  String get historyTimeline;

  /// History timeline feature description
  ///
  /// In en, this message translates to:
  /// **'Beautiful timeline view of all recorded activities'**
  String get historyTimelineDescription;

  /// Baby food recipes feature title
  ///
  /// In en, this message translates to:
  /// **'Baby Food Recipes'**
  String get babyFoodRecipes;

  /// Baby food recipes feature description
  ///
  /// In en, this message translates to:
  /// **'Age-appropriate recipes with nutritional information'**
  String get babyFoodRecipesDescription;

  /// Relaxing sounds feature title
  ///
  /// In en, this message translates to:
  /// **'Relaxing Sounds'**
  String get relaxingSounds;

  /// Relaxing sounds feature description
  ///
  /// In en, this message translates to:
  /// **'Curated collection of soothing sounds for baby'**
  String get relaxingSoundsDescription;

  /// Get started section badge
  ///
  /// In en, this message translates to:
  /// **'🚀 Get Started'**
  String get getStarted;

  /// CTA section main heading
  ///
  /// In en, this message translates to:
  /// **'Ready to make parenting easier?'**
  String get readyToMakeParentingEasier;

  /// CTA section description
  ///
  /// In en, this message translates to:
  /// **'Download Sara and start tracking your baby\'s development today. Join thousands of parents who trust Sara for their baby care journey.'**
  String get downloadSaraDescription;

  /// iOS download subtitle
  ///
  /// In en, this message translates to:
  /// **'Download for iOS'**
  String get downloadForIOS;

  /// Android download subtitle
  ///
  /// In en, this message translates to:
  /// **'Download for Android'**
  String get downloadForAndroid;

  /// App name/title
  ///
  /// In en, this message translates to:
  /// **'Track Every Precious Moment with Sara Baby'**
  String get appName;

  /// App tagline/description
  ///
  /// In en, this message translates to:
  /// **'The complete baby care companion that grows with your family. Track sleep, feeding, growth & more - 100% free, forever.'**
  String get appTagline;

  /// FAQ question about what Sara is
  ///
  /// In en, this message translates to:
  /// **'What is Sara Baby Tracker?'**
  String get faqWhatIsSara;

  /// FAQ answer about what Sara is
  ///
  /// In en, this message translates to:
  /// **'Sara is a comprehensive baby tracking app that helps parents and caregivers monitor feeding, sleep, diaper changes, growth milestones, and more. It also includes soothing sounds and baby food recipes.'**
  String get faqWhatIsSaraAnswer;

  /// FAQ question about free usage
  ///
  /// In en, this message translates to:
  /// **'Is Sara free to use?'**
  String get faqIsFree;

  /// FAQ answer about free usage
  ///
  /// In en, this message translates to:
  /// **'Yes! Sara is completely free and open-source. You can download it from the App Store or Google Play Store at no cost.'**
  String get faqIsFreeAnswer;

  /// FAQ question about data privacy
  ///
  /// In en, this message translates to:
  /// **'How is my data protected?'**
  String get faqPrivacyData;

  /// FAQ answer about data privacy
  ///
  /// In en, this message translates to:
  /// **'Sara is designed with privacy in mind. All data is stored locally on your device and is not shared with third parties. You have complete control over your information.'**
  String get faqPrivacyDataAnswer;

  /// FAQ question about multiple babies
  ///
  /// In en, this message translates to:
  /// **'Can I track multiple babies?'**
  String get faqMultipleBabies;

  /// FAQ answer about multiple babies
  ///
  /// In en, this message translates to:
  /// **'Yes! Sara supports tracking multiple babies and allows you to easily switch between them. Perfect for families with twins or multiple children.'**
  String get faqMultipleBabiesAnswer;

  /// FAQ question about offline usage
  ///
  /// In en, this message translates to:
  /// **'Does Sara work offline?'**
  String get faqOfflineUse;

  /// FAQ answer about offline usage
  ///
  /// In en, this message translates to:
  /// **'Absolutely! Sara works completely offline. All your data is stored locally on your device, so you can use it anywhere without an internet connection.'**
  String get faqOfflineUseAnswer;

  /// FAQ question about data backup
  ///
  /// In en, this message translates to:
  /// **'Can I backup my data?'**
  String get faqBackupData;

  /// FAQ answer about data backup
  ///
  /// In en, this message translates to:
  /// **'Yes, Sara provides options to backup and restore your data. You can export your data and import it on other devices or restore it if needed.'**
  String get faqBackupDataAnswer;

  /// Feeding tracker feature title
  ///
  /// In en, this message translates to:
  /// **'Feeding Tracker'**
  String get featureFeedingTracker;

  /// Feeding tracker feature description
  ///
  /// In en, this message translates to:
  /// **'Track every feeding session with ease—breastfeeding, bottle feeding, and pumping.'**
  String get featureFeedingTrackerDescription;

  /// Sleep tracker feature title
  ///
  /// In en, this message translates to:
  /// **'Sleep Tracker'**
  String get featureSleepTracker;

  /// Sleep tracker feature description
  ///
  /// In en, this message translates to:
  /// **'Monitor sleep with precise timers and built-in white noise to help your baby sleep.'**
  String get featureSleepTrackerDescription;

  /// Diaper log feature title
  ///
  /// In en, this message translates to:
  /// **'Diaper Log'**
  String get featureDiaperLog;

  /// Diaper log feature description
  ///
  /// In en, this message translates to:
  /// **'Quickly log wet, dirty, or mixed diapers with easy shortcuts and history.'**
  String get featureDiaperLogDescription;

  /// Growth milestones feature title
  ///
  /// In en, this message translates to:
  /// **'Growth & Milestones'**
  String get featureGrowthMilestones;

  /// Growth milestones feature description
  ///
  /// In en, this message translates to:
  /// **'Log weight, height, and track milestones, teething, and vaccinations.'**
  String get featureGrowthMilestonesDescription;

  /// Relaxing sounds feature title
  ///
  /// In en, this message translates to:
  /// **'Relaxing Sounds'**
  String get featureRelaxingSounds;

  /// Relaxing sounds feature description
  ///
  /// In en, this message translates to:
  /// **'Play soothing sounds and white noise to help your baby drift off.'**
  String get featureRelaxingSoundsDescription;

  /// Baby recipes feature title
  ///
  /// In en, this message translates to:
  /// **'Baby Recipes'**
  String get featureBabyRecipes;

  /// Baby recipes feature description
  ///
  /// In en, this message translates to:
  /// **'Discover healthy, age-filtered recipes with ingredients and instructions.'**
  String get featureBabyRecipesDescription;

  /// Activity history feature title
  ///
  /// In en, this message translates to:
  /// **'Activity History'**
  String get featureActivityHistory;

  /// Activity history feature description
  ///
  /// In en, this message translates to:
  /// **'View a clear timeline of your baby\'s day with search and filter options.'**
  String get featureActivityHistoryDescription;

  /// Shared family access feature title
  ///
  /// In en, this message translates to:
  /// **'Shared Family Access'**
  String get featureSharedFamilyAccess;

  /// Shared family access feature description
  ///
  /// In en, this message translates to:
  /// **'Collaborate with caregivers and easily switch between multiple babies.'**
  String get featureSharedFamilyAccessDescription;

  /// App title shown in header
  ///
  /// In en, this message translates to:
  /// **'Sara Baby Tracker & Sounds'**
  String get appTitleHeader;

  /// Get the app button text in header and drawer
  ///
  /// In en, this message translates to:
  /// **'Get the App'**
  String get getTheAppButton;

  /// Home navigation text
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNavigation;

  /// Community FlutterGoo link text
  ///
  /// In en, this message translates to:
  /// **'Community FlutterGoo'**
  String get communityFluttergoo;

  /// GitHub page link text
  ///
  /// In en, this message translates to:
  /// **'GitHub Page'**
  String get githubPage;

  /// Meet community founder section title
  ///
  /// In en, this message translates to:
  /// **'Meet Community Founder'**
  String get meetCommunityFounder;

  /// LinkedIn link text
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'id',
    'ko',
    'nl',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
