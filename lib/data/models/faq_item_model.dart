import '../../domain/entities/faq_item.dart';

class FAQItemModel extends FAQItem {
  const FAQItemModel({
    required super.id,
    required super.question,
    required super.answer,
  });

  factory FAQItemModel.fromJson(Map<String, dynamic> json) {
    return FAQItemModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }
}
