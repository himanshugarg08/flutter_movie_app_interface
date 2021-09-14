import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';

class MyIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const MyIcon(
      {Key? key,
      required this.icon,
      required this.size,
      this.color = kDarkGrey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
