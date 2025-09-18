import 'dart:async';

class LanguageChangeNotifier {
  static final LanguageChangeNotifier _instance = LanguageChangeNotifier._internal();
  factory LanguageChangeNotifier() => _instance;
  LanguageChangeNotifier._internal();

  final StreamController<String> _languageChangeController = StreamController<String>.broadcast();

  Stream<String> get languageChangeStream => _languageChangeController.stream;

  void notifyLanguageChanged(String languageCode) {
    _languageChangeController.add(languageCode);
  }

  void dispose() {
    _languageChangeController.close();
  }
}
