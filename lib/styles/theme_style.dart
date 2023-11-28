import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      background: const Color.fromARGB(255, 229, 229, 229),
      onBackground: const Color.fromARGB(255, 245, 244, 243)),
);

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 28, color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.black87,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.dark,
      background: Colors.black54,
      onSurface: Colors.amber,
      onBackground: Colors.black87),
);
