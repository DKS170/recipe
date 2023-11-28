import 'package:flutter/material.dart';

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
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 800,
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Мир кулинарных возможностей',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'Ваш персональный гид по вкусным рецептам!',
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Что в меню на сегодня',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedImageButton(
                              imagePath: 'assets/images/home.png',
                              onPressed: () {
                                // Действие при нажатии на кнопку 1
                              },
                            ),
                            RoundedImageButton(
                              imagePath: 'assets/images/home.png',
                              onPressed: () {
                                // Действие при нажатии на кнопку 2
                              },
                            ),
                            RoundedImageButton(
                              imagePath: 'assets/images/home.png',
                              onPressed: () {
                                // Действие при нажатии на кнопку 3
                              },
                            ),
                            RoundedImageButton(
                              imagePath: 'assets/images/home.png',
                              onPressed: () {
                                // Действие при нажатии на кнопку 4
                              },
                            ),
                          ],
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
    );
  }
}

class RoundedImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const RoundedImageButton({
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit
                .cover, // Задаем тип подгонки изображения под размер контейнера
          ),
        ),
      ),
    );
  }
}
