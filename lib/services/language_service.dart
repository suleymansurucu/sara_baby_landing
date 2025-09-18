import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageKey = 'selected_language';
  static const String _defaultLanguage = 'en';
  
  // Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', ''), // English
    Locale('tr', ''), // Turkish
    Locale('de', ''), // German
    Locale('es', ''), // Spanish
    Locale('fr', ''), // French
    Locale('ar', ''), // Arabic
    Locale('zh', ''), // Chinese
    Locale('nl', ''), // Dutch
    Locale('ru', ''), // Russian
    Locale('ko', ''), // Korean
    Locale('id', ''), // Indonesian
  ];

  // Language names in their native language
  static const Map<String, String> languageNames = {
    'en': 'English',
    'tr': 'Türkçe',
    'de': 'Deutsch',
    'es': 'Español',
    'fr': 'Français',
    'ar': 'العربية',
    'zh': '中文',
    'nl': 'Nederlands',
    'ru': 'Русский',
    'ko': '한국어',
    'id': 'Bahasa Indonesia',
  };

  /// Get the current language from shared preferences
  static Future<String> getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? _defaultLanguage;
  }

  /// Set the current language in shared preferences
  static Future<void> setCurrentLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  /// Get the current locale based on stored language or system locale
  static Future<Locale> getCurrentLocale() async {
    final storedLanguage = await getCurrentLanguage();
    
    // If user has manually selected a language, use it
    if (storedLanguage != _defaultLanguage) {
      return Locale(storedLanguage);
    }
    
    // Otherwise, try to detect from system locale
    final systemLocale = PlatformDispatcher.instance.locale;
    final systemLanguageCode = systemLocale.languageCode;
    
    // Check if system language is supported
    if (supportedLocales.any((locale) => locale.languageCode == systemLanguageCode)) {
      return Locale(systemLanguageCode);
    }
    
    // Fallback to default language
    return const Locale(_defaultLanguage);
  }

  /// Get language name by code
  static String getLanguageName(String languageCode) {
    return languageNames[languageCode] ?? languageCode;
  }

  /// Check if a language code is supported
  static bool isLanguageSupported(String languageCode) {
    return supportedLocales.any((locale) => locale.languageCode == languageCode);
  }
}
