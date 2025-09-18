import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/language_service.dart';
import '../../services/language_change_notifier.dart';
import '../../generated/l10n/app_localizations.dart';

class LanguageSelector extends StatefulWidget {
  final bool isCompact;
  
  const LanguageSelector({
    super.key,
    this.isCompact = false,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _currentLanguage = 'en';

  // Country flags for each language - using widely recognized flag representations
  static const Map<String, String> languageFlags = {
    'en': '🇺🇸', // United States flag for English
    'tr': '🇹🇷', // Turkey flag for Turkish
    'de': '🇩🇪', // Germany flag for German
    'es': '🇪🇸', // Spain flag for Spanish
    'fr': '🇫🇷', // France flag for French
    'ar': '🇸🇦', // Saudi Arabia flag for Arabic (widely recognized)
    'zh': '🇨🇳', // China flag for Chinese
    'nl': '🇳🇱', // Netherlands flag for Dutch
    'ru': '🇷🇺', // Russia flag for Russian
    'ko': '🇰🇷', // South Korea flag for Korean
    'id': '🇮🇩', // Indonesia flag for Indonesian
  };

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    final language = await LanguageService.getCurrentLanguage();
    setState(() {
      _currentLanguage = language;
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    await LanguageService.setCurrentLanguage(languageCode);
    setState(() {
      _currentLanguage = languageCode;
    });
    
    // Notify the app about language change
    LanguageChangeNotifier().notifyLanguageChanged(languageCode);
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.selectLanguage,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          content: SizedBox(
            width: 280,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: LanguageService.supportedLocales.length,
              itemBuilder: (context, index) {
                final locale = LanguageService.supportedLocales[index];
                final languageCode = locale.languageCode;
                final languageName = LanguageService.getLanguageName(languageCode);
                final flag = languageFlags[languageCode] ?? '🏳️';
                final isSelected = languageCode == _currentLanguage;
                
                return InkWell(
                  onTap: () {
                    _changeLanguage(languageCode);
                    Navigator.of(context).pop();
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected 
                          ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected 
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                          child: Text(
                            flag,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            languageName,
                            style: GoogleFonts.poppins(
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 12,
                              color: isSelected 
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguageName = LanguageService.getLanguageName(_currentLanguage);
    final currentFlag = languageFlags[_currentLanguage] ?? '🏳️';
    
    if (widget.isCompact) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: _showLanguageDialog,
          icon: Text(
            currentFlag,
            style: const TextStyle(fontSize: 20),
          ),
          tooltip: '${AppLocalizations.of(context)!.language} - $currentLanguageName',
          padding: const EdgeInsets.all(8),
          constraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
        ),
      );
    }
    
    return OutlinedButton.icon(
      onPressed: _showLanguageDialog,
      icon: Text(
        currentFlag,
        style: const TextStyle(fontSize: 16),
      ),
      label: Text(
        currentLanguageName,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
