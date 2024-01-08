import 'package:flutter/material.dart';
import 'package:recipe/app.dart';
import 'package:recipe/providers/app_provider.dart';
import 'package:recipe/styles/theme_style.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';

void main() {
  runApp(const MyApp());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
    ),
  ], child: const App()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<AppProvider>().themeMode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
