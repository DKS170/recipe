import 'package:flutter/material.dart';
import 'package:recipe/providers/app_provider.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Column(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('Whet recipe are you looking for today?'),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<AppProvider>().changeTherme(false);
            },
            tooltip: 'Light',
            child: const Icon(Icons.abc),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<AppProvider>().changeTherme(true);
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
}
