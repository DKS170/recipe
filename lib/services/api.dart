import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/category.dart';
import '../models/meal.dart';

class Api {
  final baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<List<MealModel>> getMealsByCategory(String category) async {
    try {
      final response = await Dio().get('$baseUrl/filter.php?c=$category');
      return parseMeals(response.data);
    } catch (error) {
      log('Error fetching meals by category: $error');
      throw Exception('Failed to load meals by category');
    }
  }

  List<MealModel> parseMeals(Map<String, dynamic> json) {
    List<dynamic> mealsJson = json['meals'];
    return mealsJson.map((mealJson) => MealModel.fromJson(mealJson)).toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await Dio().get('$baseUrl/categories.php');
      return parseCategories(response.data);
    } catch (error) {
      log('Error fetching categories: $error');
      throw Exception('Failed to load categories');
    }
  }

  List<CategoryModel> parseCategories(Map<String, dynamic> json) {
    List<dynamic> categoriesJson = json['categories'];
    return categoriesJson
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();
  }
}
