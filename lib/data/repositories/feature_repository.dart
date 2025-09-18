import 'package:flutter/material.dart';
import '../../domain/entities/feature.dart';
import '../models/feature_model.dart';
import '../../generated/l10n/app_localizations.dart';

abstract class FeatureRepository {
  Future<List<Feature>> getFeatures(BuildContext context);
}

class FeatureRepositoryImpl implements FeatureRepository {
  @override
  Future<List<Feature>> getFeatures(BuildContext context) async {
    // Capture localization data before async operation
    final l10n = AppLocalizations.of(context)!;
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      FeatureModel(
        id: 'feeding_tracker',
        title: l10n.featureFeedingTracker,
        description: l10n.featureFeedingTrackerDescription,
        iconAsset: 'assets/images/feed.png',
        gradientColors: ['0xFFFF6B9D', '0xFFC44569'],
      ),
      FeatureModel(
        id: 'sleep_tracker',
        title: l10n.featureSleepTracker,
        description: l10n.featureSleepTrackerDescription,
        iconAsset: 'assets/images/sleep.png',
        gradientColors: ['0xFF667EEA', '0xFF764BA2'],
      ),
      FeatureModel(
        id: 'diaper_log',
        title: l10n.featureDiaperLog,
        description: l10n.featureDiaperLogDescription,
        iconAsset: 'assets/images/diaper.png',
        gradientColors: ['0xFFF093FB', '0xFFF5576C'],
      ),
      FeatureModel(
        id: 'growth_milestones',
        title: l10n.featureGrowthMilestones,
        description: l10n.featureGrowthMilestonesDescription,
        iconAsset: 'assets/images/growth.png',
        gradientColors: ['0xFF4ECDC4', '0xFF44A08D'],
      ),
      FeatureModel(
        id: 'relaxing_sounds',
        title: l10n.featureRelaxingSounds,
        description: l10n.featureRelaxingSoundsDescription,
        iconAsset: 'assets/images/sounds_icon.png',
        gradientColors: ['0xFFA8E6CF', '0xFFDCEDC1'],
      ),
      FeatureModel(
        id: 'baby_recipes',
        title: l10n.featureBabyRecipes,
        description: l10n.featureBabyRecipesDescription,
        iconAsset: 'assets/images/recipe_icon.png',
        gradientColors: ['0xFFFFD93D', '0xFFFF8C42'],
      ),
      FeatureModel(
        id: 'activity_history',
        title: l10n.featureActivityHistory,
        description: l10n.featureActivityHistoryDescription,
        iconAsset: 'assets/images/activity_history.png',
        gradientColors: ['0xFF667EEA', '0xFF764BA2'],
      ),
      FeatureModel(
        id: 'shared_family_access',
        title: l10n.featureSharedFamilyAccess,
        description: l10n.featureSharedFamilyAccessDescription,
        iconAsset: 'assets/images/share_family_icon.png',
        gradientColors: ['0xFFFF6B9D', '0xFFC44569'],
      ),
    ];
  }
}
