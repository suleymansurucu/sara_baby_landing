class AppInfo {
  final String name;
  final String tagline;
  final String description;
  final String logoAsset;
  final String appStoreUrl;
  final String googlePlayUrl;
  final String githubUrl;
  final bool isOpenSource;

  const AppInfo({
    required this.name,
    required this.tagline,
    required this.description,
    required this.logoAsset,
    required this.appStoreUrl,
    required this.googlePlayUrl,
    required this.githubUrl,
    this.isOpenSource = true,
  });
}
