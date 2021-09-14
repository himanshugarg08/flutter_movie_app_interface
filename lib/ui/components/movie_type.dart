import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MovieType extends StatefulWidget {
  const MovieType({Key? key}) : super(key: key);

  @override
  _MovieTypeState createState() => _MovieTypeState();
}

class _MovieTypeState extends State<MovieType> {
  int _selectedIndex = 0;
  List<String> movieType = ["Popular", "New", "Upcoming"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movieType.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getWidth(2.5),
                vertical: SizeConfig.getHeight(1.5)),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: movieType[index],
                    size: 18,
                    color: index == _selectedIndex ? Colors.black : kDarkGrey,
                    weight: index == _selectedIndex
                        ? FontWeight.w800
                        : FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 5,
                    width: 28,
                    decoration: BoxDecoration(
                      color: index == _selectedIndex
                          ? kPrimaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
