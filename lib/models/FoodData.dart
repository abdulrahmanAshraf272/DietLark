class FoodData {
  int id;
  final String title, description;
  final int amountScale;
  final String image;
  final int calories;
  final double protein, carb, fat;

  FoodData({
    required this.id,
    required this.title,
    required this.description,
    required this.amountScale,
    required this.image,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carb,
  });
}
