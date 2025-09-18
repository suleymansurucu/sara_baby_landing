import 'package:flutter/material.dart';
import '../entities/feature.dart';
import '../../data/repositories/feature_repository.dart';

class GetFeatures {
  final FeatureRepository _repository;

  GetFeatures(this._repository);

  Future<List<Feature>> call(BuildContext context) async {
    return await _repository.getFeatures(context);
  }
}
