import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(6),
      width: SizeConfig.getWidth(80),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffa9b4cf).withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 16,
              offset: const Offset(0, 2),
            ),
          ]),
      child: const Center(
          child: MyText(
        text: "Buy Tickets",
        size: 22,
        color: Colors.white,
      )),
    );
  }
}
