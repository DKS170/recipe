class MealModel {
  String? idMeal;
  String? strMeal;
  String? strMealThumb;

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }
}
