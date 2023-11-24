import 'package:flutter/material.dart';

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
    );
  }
}