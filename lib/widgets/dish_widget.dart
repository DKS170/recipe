import 'package:flutter/material.dart';

class DishWidget extends StatelessWidget {
  final String dishName;
  final String imageUrl;

  DishWidget({required this.dishName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Любой цвет, который хотите использовать
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dishName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Image.network(
              imageUrl,
              height: 100, // Установите размеры изображения по вашему желанию
              width: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
