import '../../domain/entities/feature.dart';

class FeatureModel extends Feature {
  const FeatureModel({
    required super.id,
    required super.title,
    required super.description,
    required super.iconAsset,
    required super.gradientColors,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconAsset: json['iconAsset'] as String,
      gradientColors: List<String>.from(json['gradientColors'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconAsset': iconAsset,
      'gradientColors': gradientColors,
    };
  }
}
