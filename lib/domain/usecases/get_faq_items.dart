import 'package:flutter/material.dart';
import '../entities/faq_item.dart';
import '../../data/repositories/faq_repository.dart';

class GetFAQItems {
  final FAQRepository _repository;

  GetFAQItems(this._repository);

  Future<List<FAQItem>> call(BuildContext context) async {
    return await _repository.getFAQItems(context);
  }
}
