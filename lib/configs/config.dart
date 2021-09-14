import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFFfd7468);
const kSecondaryColor = Color(0xffe9effb);
// const greenColor = Color(0xffa4e6ab);
// const redColor = Color(0xfffe5053);
// const darkGrey = Color(0xff515151);
// const extraLightGrey = Color(0xffeeeeee);
const kLightGrey = Color(0xffa4a7ac);
const kDarkGrey = Color(0xff525763);
//const white = Color(0xffffffff);

const kDefaultHeight = 2.0;

final BoxShadow myBoxShadow = BoxShadow(
  color: const Color(0xffa9b4cf).withOpacity(0.4),
  spreadRadius: 1,
  blurRadius: 10,
  offset: const Offset(0, 4),
);

TextStyle textStyle(double size, FontWeight weight, Color color) {
  return //TextStyle(fontSize: size, fontWeight: weight, color: color);
      GoogleFonts.openSans(fontSize: size, fontWeight: weight, color: color);
}

class SizeConfig {
  static late MediaQueryData mediaQuery;
  static late double screenHeight;
  static late double screenWidth;
  static late double screenHeightWithPadding;
  static late double screenWidthWithPadding;
  static late double screenWidthPadding;
  static late double screenHeightPadding;

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery.size.height;
    screenWidth = mediaQuery.size.width;
    screenWidthPadding = mediaQuery.padding.left + mediaQuery.padding.right;
    screenHeightPadding = mediaQuery.padding.top + mediaQuery.padding.bottom;
    screenHeightWithPadding = screenHeight - screenHeightPadding;
    screenWidthWithPadding = screenWidth - screenWidthPadding;
  }

  static double getHeight(double height) {
    return (screenHeightWithPadding / 100) * height;
  }

  static double getWidth(double width) {
    return (screenWidthWithPadding / 100) * width;
  }
}

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, this.of = kDefaultHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getHeight(of),
    );
  }
}
