import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';

class MyBottomNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onChange;

  const MyBottomNavBar(
      {Key? key, this.selectedItem = 0, required this.onChange})
      : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedItem;
  }

  buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChange(index);
          _selectedIndex = index;
        });
      },
      child: Container(
        height: SizeConfig.getHeight(5),
        width: SizeConfig.getWidth(20),
        decoration: BoxDecoration(
          color: index == _selectedIndex ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.white : Colors.grey,
          size: 28,
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(4)),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(50), bottom: Radius.zero),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xffa9b4cf).withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ]),
      height: SizeConfig.getHeight(11),
      width: SizeConfig.getWidth(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavBarItem(Icons.home, 0),
          buildNavBarItem(Icons.bookmark_border_outlined, 1),
          buildNavBarItem(Icons.person_outline_rounded, 2),
        ],
      ),
    );
  }
}
