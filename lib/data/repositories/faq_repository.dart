import '../../domain/entities/faq_item.dart';
import '../models/faq_item_model.dart';

abstract class FAQRepository {
  Future<List<FAQItem>> getFAQItems();
}

class FAQRepositoryImpl implements FAQRepository {
  @override
  Future<List<FAQItem>> getFAQItems() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      const FAQItemModel(
        id: 'what_is_sara',
        question: 'What is Sara Baby Tracker?',
        answer: 'Sara is a comprehensive baby tracking app that helps parents and caregivers monitor feeding, sleep, diaper changes, growth milestones, and more. It also includes soothing sounds and baby food recipes.',
      ),
      const FAQItemModel(
        id: 'is_free',
        question: 'Is Sara free to use?',
        answer: 'Yes! Sara is completely free and open-source. You can download it from the App Store or Google Play Store at no cost.',
      ),
      const FAQItemModel(
        id: 'privacy_data',
        question: 'How is my data protected?',
        answer: 'Sara is designed with privacy in mind. All data is stored locally on your device and is not shared with third parties. You have complete control over your information.',
      ),
      const FAQItemModel(
        id: 'multiple_babies',
        question: 'Can I track multiple babies?',
        answer: 'Yes! Sara supports tracking multiple babies and allows you to easily switch between them. Perfect for families with twins or multiple children.',
      ),
      const FAQItemModel(
        id: 'offline_use',
        question: 'Does Sara work offline?',
        answer: 'Absolutely! Sara works completely offline. All your data is stored locally on your device, so you can use it anywhere without an internet connection.',
      ),
      const FAQItemModel(
        id: 'backup_data',
        question: 'Can I backup my data?',
        answer: 'Yes, Sara provides options to backup and restore your data. You can export your data and import it on other devices or restore it if needed.',
      ),
    ];
  }
}
