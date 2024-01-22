import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:recipe/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/counter_provider.dart';
import 'package:recipe/services/api.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Api _api = Api();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await _api.getCategories();
      context.read<CounterProvider>().setCategories(categories);
    } catch (error) {
      print('Error loading categories: $error');
    }
  }

  Future<void> _loadMealsByCategory(String category) async {
    try {
      final meals = await _api.getMealsByCategory(category);
      context.read<CounterProvider>().setMeal(meals);
    } catch (error) {
      print('Error loading meals by category: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CounterProvider>().categories ?? [];
    final selectedMeals = context.watch<CounterProvider>().meals ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final category in categories)
                    GestureDetector(
                      onTap: () => _loadMealsByCategory(category.strCategory!),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(category.strCategory!),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: selectedMeals.isNotEmpty
                ? ListView.builder(
                    itemCount: selectedMeals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(selectedMeals[index].strMeal!),
                        subtitle: Image.network(
                          '${selectedMeals[index].strMealThumb}/preview',
                          height: 100.0,
                          width: 100.0,
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Выберите категорию блюд',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
          ),
        ],
      ),
      // ... остальной код виджета
    );
  }
}
