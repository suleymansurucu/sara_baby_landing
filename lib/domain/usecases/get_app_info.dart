import 'package:flutter/material.dart';
import '../entities/app_info.dart';
import '../../data/repositories/app_info_repository.dart';

class GetAppInfo {
  final AppInfoRepository _repository;

  GetAppInfo(this._repository);

  Future<AppInfo> call(BuildContext context) async {
    return await _repository.getAppInfo(context);
  }
}
