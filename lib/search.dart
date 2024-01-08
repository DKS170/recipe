import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:recipe/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/counter_provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<CounterProvider>(context, listen: false).listCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(children: [
        SizedBox(
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Оберните ваш текущий ListView.builder в SingleChildScrollView
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      context.watch<CounterProvider>().categories?.length ?? 0,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              context
                                      .watch<CounterProvider>()
                                      .categories?[index]
                                      .strCategory ??
                                  '',
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
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
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
