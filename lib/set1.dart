import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';

class Set extends StatefulWidget {
  Set({Key? key}) : super(key: key);

  @override
  _SetState createState() => _SetState();
}

class _SetState extends State<Set> {
  Dio _dio = Dio();
  Map<String, dynamic> _meal = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Meal Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _getRandomMeal,
              child: Text('Get Random Meal'),
            ),
            SizedBox(height: 20),
            _meal.isNotEmpty
                ? Column(
                    children: [
                      Text('Meal Name: ${_meal['strMeal']}'),
                      Text('Category: ${_meal['strCategory']}'),
                      // Другие данные о блюде
                    ],
                  )
                : Container(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<AppProvider>().changeTheme(false);
            },
            tooltip: 'Light',
            child: const Icon(Icons.abc),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<AppProvider>().changeTheme(true);
            },
            tooltip: 'Dark',
            child: const Icon(Icons.ac_unit),
          ),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }

  void _getRandomMeal() async {
    try {
      Response response =
          await _dio.get('https://www.themealdb.com/api/json/v1/1/random.php');
      if (response.statusCode == 200) {
        // Обработка успешного ответа
        Map<String, dynamic> meal = response.data['meals'][0];
        setState(() {
          _meal = meal;
        });
      } else {
        // Обработка ошибки
        print('Failed to load random meal');
      }
    } catch (error) {
      // Обработка ошибки
      print('Error: $error');
    }
  }
}
