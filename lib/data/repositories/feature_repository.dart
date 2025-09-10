import '../../domain/entities/feature.dart';
import '../models/feature_model.dart';

abstract class FeatureRepository {
  Future<List<Feature>> getFeatures();
}

class FeatureRepositoryImpl implements FeatureRepository {
  @override
  Future<List<Feature>> getFeatures() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      const FeatureModel(
        id: 'feeding_tracker',
        title: 'Feeding Tracker',
        description: 'Track every feeding session with ease—breastfeeding, bottle feeding, and pumping.',
        iconAsset: 'assets/images/feed.png',
        gradientColors: ['0xFFFF6B9D', '0xFFC44569'],
      ),
      const FeatureModel(
        id: 'sleep_tracker',
        title: 'Sleep Tracker',
        description: 'Monitor sleep with precise timers and built-in white noise to help your baby sleep.',
        iconAsset: 'assets/images/sleep.png',
        gradientColors: ['0xFF667EEA', '0xFF764BA2'],
      ),
      const FeatureModel(
        id: 'diaper_log',
        title: 'Diaper Log',
        description: 'Quickly log wet, dirty, or mixed diapers with easy shortcuts and history.',
        iconAsset: 'assets/images/diaper.png',
        gradientColors: ['0xFFF093FB', '0xFFF5576C'],
      ),
      const FeatureModel(
        id: 'growth_milestones',
        title: 'Growth & Milestones',
        description: 'Log weight, height, and track milestones, teething, and vaccinations.',
        iconAsset: 'assets/images/growth.png',
        gradientColors: ['0xFF4ECDC4', '0xFF44A08D'],
      ),
      const FeatureModel(
        id: 'relaxing_sounds',
        title: 'Relaxing Sounds',
        description: 'Play soothing sounds and white noise to help your baby drift off.',
        iconAsset: 'assets/images/sounds_icon.png',
        gradientColors: ['0xFFA8E6CF', '0xFFDCEDC1'],
      ),
      const FeatureModel(
        id: 'baby_recipes',
        title: 'Baby Recipes',
        description: 'Discover healthy, age-filtered recipes with ingredients and instructions.',
        iconAsset: 'assets/images/recipe_icon.png',
        gradientColors: ['0xFFFFD93D', '0xFFFF8C42'],
      ),
      const FeatureModel(
        id: 'activity_history',
        title: 'Activity History',
        description: 'View a clear timeline of your baby\'s day with search and filter options.',
        iconAsset: 'assets/images/activity_history.png',
        gradientColors: ['0xFF667EEA', '0xFF764BA2'],
      ),
      const FeatureModel(
        id: 'shared_family_access',
        title: 'Shared Family Access',
        description: 'Collaborate with caregivers and easily switch between multiple babies.',
        iconAsset: 'assets/images/share_family_icon.png',
        gradientColors: ['0xFFFF6B9D', '0xFFC44569'],
      ),
    ];
  }
}
