import '../../domain/entities/app_info.dart';

class AppInfoModel extends AppInfo {
  const AppInfoModel({
    required super.name,
    required super.tagline,
    required super.description,
    required super.logoAsset,
    required super.appStoreUrl,
    required super.googlePlayUrl,
    required super.githubUrl,
    super.isOpenSource = true,
  });

  factory AppInfoModel.fromJson(Map<String, dynamic> json) {
    return AppInfoModel(
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      logoAsset: json['logoAsset'] as String,
      appStoreUrl: json['appStoreUrl'] as String,
      googlePlayUrl: json['googlePlayUrl'] as String,
      githubUrl: json['githubUrl'] as String,
      isOpenSource: json['isOpenSource'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tagline': tagline,
      'description': description,
      'logoAsset': logoAsset,
      'appStoreUrl': appStoreUrl,
      'googlePlayUrl': googlePlayUrl,
      'githubUrl': githubUrl,
      'isOpenSource': isOpenSource,
    };
  }
}
