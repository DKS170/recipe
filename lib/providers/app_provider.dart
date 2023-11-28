import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  changeTherme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
