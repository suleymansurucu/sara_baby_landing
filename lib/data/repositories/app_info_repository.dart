import '../../domain/entities/app_info.dart';
import '../models/app_info_model.dart';

abstract class AppInfoRepository {
  Future<AppInfo> getAppInfo();
}

class AppInfoRepositoryImpl implements AppInfoRepository {
  @override
  Future<AppInfo> getAppInfo() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 50));
    
    return const AppInfoModel(
      name: 'Sara Baby Tracker & Sounds',
      tagline: 'All-in-one baby care: Track, Feed, Sleep, and Grow Together.',
      description: 'Sara is an open-source Flutter app that helps parents and caregivers track daily baby activities, share responsibilities, and create a calm environment with soothing sleep sounds and baby food recipes.',
      logoAsset: 'assets/logos/sara_baby_logo.png',
      appStoreUrl: 'https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy',
      githubUrl: 'https://github.com/suleymansurucu/flutter_sara_baby_tracker_and_sounds',
      isOpenSource: true,
    );
  }
}
