import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
      this.color = const Color.fromARGB(255, 14, 12, 7),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          color: color, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
    );
  }
}
