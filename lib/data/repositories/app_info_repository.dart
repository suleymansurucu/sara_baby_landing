import 'package:flutter/material.dart';
import '../../domain/entities/app_info.dart';
import '../models/app_info_model.dart';
import '../../generated/l10n/app_localizations.dart';

abstract class AppInfoRepository {
  Future<AppInfo> getAppInfo(BuildContext context);
}

class AppInfoRepositoryImpl implements AppInfoRepository {
  @override
  Future<AppInfo> getAppInfo(BuildContext context) async {
    // Capture localization data before async operation
    final l10n = AppLocalizations.of(context)!;
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 50));
    
    return AppInfoModel(
      name: l10n.appName,
      tagline: l10n.appTagline,
      description: '',
      logoAsset: 'assets/logos/sara_baby_logo.png',
      appStoreUrl: 'https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy',
      githubUrl: 'https://github.com/fluttergoo/open_baby_sara',
      isOpenSource: false,
    );
  }
}
