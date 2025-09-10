import '../entities/app_info.dart';
import '../../data/repositories/app_info_repository.dart';

class GetAppInfo {
  final AppInfoRepository _repository;

  GetAppInfo(this._repository);

  Future<AppInfo> call() async {
    return await _repository.getAppInfo();
  }
}
