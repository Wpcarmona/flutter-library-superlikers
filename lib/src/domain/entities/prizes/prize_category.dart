class PrizeCategory {
  final String name;
  final Map<String, String> choices;

  PrizeCategory({
    required this.name,
    required this.choices,
  });

  String get id => choices['id'] ?? '';
  String get image => choices['image'] ?? '';
  String get category => choices['category'] ?? '';
}
