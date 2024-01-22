import 'package:flutter/material.dart';
import 'package:recipe/models/meal.dart';
import 'package:recipe/services/api.dart';

import '../models/category.dart';

class CounterProvider extends ChangeNotifier {
  Color color = const Color.fromARGB(255, 255, 255, 255);
  double height = 200.0;
  CategoryModel? selectedCategory;
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

  setCategories(data) {
    categories = data;
    notifyListeners();
  }

  setMeal(data) {
    meals = data;
    notifyListeners();
  }

  void setRandomMeal(MealModel meal) {
    meals = [meal];
    notifyListeners();
  }

  List<MealModel>? selectedMeals;
  void someMethod() {
    // Правильное использование переменной meals
    if (meals != null && meals!.isNotEmpty) {
      // Доступ к элементам meals
      print(meals![0].strMeal);
    }
  }
}
