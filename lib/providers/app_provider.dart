import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  applyTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('theme') ?? true;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  changeTherme(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', isDark);
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
