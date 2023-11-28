import 'package:flutter/material.dart';
import 'package:recipe/models/meal.dart';
import 'package:recipe/services/api.dart';

import '../models/category.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  Color color = Colors.red;
  double height = 300.0;
  List<MealModel>? meals;
  List<CategoryModel>? categories;

  bool isLoading = false;

  void incrementCounter() {
    counter++;
    color = Colors.amber;
    height = 300;
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    color = Colors.orange;
    height = 600;
    notifyListeners();
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
