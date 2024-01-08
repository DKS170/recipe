import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/providers/counter_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 1000,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 800,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Мир кулинарных возможностей',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const Text(
                          'Ваш персональный гид по вкусным рецептам!',
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Что в меню на сегодня',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            children: [
                              RoundedImageButton(
                                imagePath: 'assets/images/breakfast.png',
                                buttonText: 'Завтрак',
                                onPressed: () {
                                  // Действие при нажатии на кнопку 1
                                },
                              ),
                              const SizedBox(
                                  width:
                                      16), // добавим расстояние между кнопками
                              RoundedImageButton(
                                imagePath: 'assets/images/lunch.png',
                                buttonText: 'Обед',
                                onPressed: () {
                                  // Действие при нажатии на кнопку 2
                                },
                              ),
                              const SizedBox(
                                  width:
                                      16), // добавим расстояние между кнопками
                              RoundedImageButton(
                                imagePath: 'assets/images/snack.png',
                                buttonText: 'Перекус',
                                onPressed: () {
                                  // Действие при нажатии на кнопку 3
                                },
                              ),
                              const SizedBox(
                                  width:
                                      16), // добавим расстояние между кнопками
                              RoundedImageButton(
                                imagePath: 'assets/images/dinner.png',
                                buttonText: 'Ужин',
                                onPressed: () {
                                  // Действие при нажатии на кнопку 4
                                },
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: AnimatedContainer(
                            color: Theme.of(context).colorScheme.onBackground,
                            duration: const Duration(milliseconds: 500),
                            height: context.watch<CounterProvider>().height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  context
                                          .watch<CounterProvider>()
                                          .meals
                                          ?.first
                                          .strMeal ??
                                      '',
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Category: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface),
                                    ),
                                    Text(
                                      context
                                              .watch<CounterProvider>()
                                              .meals
                                              ?.first
                                              .strCategory ??
                                          '',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${context.watch<CounterProvider>().meals?.first.strIngredient1 ?? ''}:',
                                    ),
                                    Text(
                                      context
                                              .watch<CounterProvider>()
                                              .meals
                                              ?.first
                                              .strMeasure1 ??
                                          '',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${context.watch<CounterProvider>().meals?.first.strIngredient2 ?? ''}:',
                                    ),
                                    Text(
                                      context
                                              .watch<CounterProvider>()
                                              .meals
                                              ?.first
                                              .strMeasure2 ??
                                          '',
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${context.watch<CounterProvider>().meals?.first.strIngredient3 ?? ''}:',
                                    ),
                                    Text(
                                      context
                                              .watch<CounterProvider>()
                                              .meals
                                              ?.first
                                              .strMeasure3 ??
                                          '',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().incrementCounter();
              // context.read<CounterProvider>().getActivity();
              context.read<CounterProvider>().listMeal();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}

class RoundedImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String buttonText;

  const RoundedImageButton({
    required this.imagePath,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(0, 15, 5, 5).withOpacity(0.4),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 253, 253, 253),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
