import 'package:flutter/material.dart';
import '../../domain/entities/app_info.dart';
import '../../domain/entities/feature.dart';
import '../../domain/entities/faq_item.dart';
import '../../domain/usecases/get_app_info.dart';
import '../../domain/usecases/get_features.dart';
import '../../domain/usecases/get_faq_items.dart';

class LandingController extends ChangeNotifier {
  final GetAppInfo _getAppInfo;
  final GetFeatures _getFeatures;
  final GetFAQItems _getFAQItems;

  LandingController(
    this._getAppInfo,
    this._getFeatures,
    this._getFAQItems,
  );

  AppInfo? _appInfo;
  List<Feature> _features = [];
  List<FAQItem> _faqItems = [];
  bool _isLoading = true;
  String? _error;

  AppInfo? get appInfo => _appInfo;
  List<Feature> get features => _features;
  List<FAQItem> get faqItems => _faqItems;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _getAppInfo(),
        _getFeatures(),
        _getFAQItems(),
      ]);

      _appInfo = results[0] as AppInfo;
      _features = results[1] as List<Feature>;
      _faqItems = results[2] as List<FAQItem>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
