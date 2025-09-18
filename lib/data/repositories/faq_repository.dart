import 'package:flutter/material.dart';
import '../../domain/entities/faq_item.dart';
import '../models/faq_item_model.dart';
import '../../generated/l10n/app_localizations.dart';

abstract class FAQRepository {
  Future<List<FAQItem>> getFAQItems(BuildContext context);
}

class FAQRepositoryImpl implements FAQRepository {
  @override
  Future<List<FAQItem>> getFAQItems(BuildContext context) async {
    // Capture localization data before async operation
    final l10n = AppLocalizations.of(context)!;
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      FAQItemModel(
        id: 'what_is_sara',
        question: l10n.faqWhatIsSara,
        answer: l10n.faqWhatIsSaraAnswer,
      ),
      FAQItemModel(
        id: 'is_free',
        question: l10n.faqIsFree,
        answer: l10n.faqIsFreeAnswer,
      ),
      FAQItemModel(
        id: 'privacy_data',
        question: l10n.faqPrivacyData,
        answer: l10n.faqPrivacyDataAnswer,
      ),
      FAQItemModel(
        id: 'multiple_babies',
        question: l10n.faqMultipleBabies,
        answer: l10n.faqMultipleBabiesAnswer,
      ),
      FAQItemModel(
        id: 'offline_use',
        question: l10n.faqOfflineUse,
        answer: l10n.faqOfflineUseAnswer,
      ),
      FAQItemModel(
        id: 'backup_data',
        question: l10n.faqBackupData,
        answer: l10n.faqBackupDataAnswer,
      ),
    ];
  }
}
