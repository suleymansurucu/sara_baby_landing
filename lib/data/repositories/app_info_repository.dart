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
      name: 'Track Every Precious Moment with Sara Baby',
      tagline: 'The complete baby care companion that grows with your family. Track sleep, feeding, growth & more - 100% free, forever.',
      description: '',
      logoAsset: 'assets/logos/sara_baby_logo.png',
      appStoreUrl: 'https://apps.apple.com/us/app/sara-baby-tracker-sounds/id6746516938',
      googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.suleymansurucu.sarababy',
      githubUrl: 'https://github.com/fluttergoo/open_baby_sara',
      isOpenSource: false,
    );
  }
}
