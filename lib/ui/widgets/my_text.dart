import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign align;

  const MyText(
      {Key? key,
      required this.text,
      required this.size,
      this.weight = FontWeight.w500,
      this.color = kDarkGrey,
      this.align = TextAlign.left})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.fade,
      style: textStyle(size, weight, color),
    );
  }
}
