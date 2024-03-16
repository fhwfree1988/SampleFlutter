class Food {
  final String id;
  final String title;
  final int cost;

  const Food({required this.id, required this.title,required this.cost});

  factory Food.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'title': String title,
      'cost' : int cost,
      } =>
          Food(
            id: id,
            title: title,
            cost: cost,
          ),
      _ => throw const FormatException('Failed to load food.'),
    };
  }
}