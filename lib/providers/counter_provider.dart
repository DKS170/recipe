import 'package:flutter/material.dart';
import 'package:recipe/models/meal.dart';
import 'package:recipe/services/api.dart';

import '../models/category.dart';

class CounterProvider extends ChangeNotifier {
  Color color = const Color.fromARGB(255, 255, 255, 255);
  double height = 200.0;

  List<MealModel>? meals;
  List<CategoryModel>? categories;

  bool isLoading = false;

  void incrementCounter() {
    color = Colors.amber;
    height = 200;
    notifyListeners();
  }

  Widget roundedBox() {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: height,
    );
  }

  setStatus(value) {
    isLoading = value;
  }

  void listCategories() async {
    List<CategoryModel> data = await Api().listCategories();
    setCategories(data);
  }

  setCategories(data) {
    categories = data;
    notifyListeners();
  }

  void listMeal() async {
    setStatus(true);
    List<MealModel> data = await Api().listMeals();
    setMeal(data);
  }

  setMeal(data) {
    meals = data;
    setStatus(false);
    notifyListeners();
  }
}
