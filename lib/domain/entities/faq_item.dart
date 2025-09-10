class FAQItem {
  final String id;
  final String question;
  final String answer;

  const FAQItem({
    required this.id,
    required this.question,
    required this.answer,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FAQItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
