class Feature {
  final String id;
  final String title;
  final String description;
  final String iconAsset;
  final List<String> gradientColors;

  const Feature({
    required this.id,
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.gradientColors,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Feature && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
