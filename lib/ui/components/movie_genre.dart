import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MovieGenre extends StatefulWidget {
  const MovieGenre({Key? key}) : super(key: key);

  @override
  _MovieGenreState createState() => _MovieGenreState();
}

class _MovieGenreState extends State<MovieGenre> {
  int _selectedIndex = 0;
  List<String> movieGenere = ["Drama", "Horor", "Action", "Romance"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        itemCount: movieGenere.length,
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
              child: Container(
                height: 20,
                width: SizeConfig.getWidth(20),
                decoration: BoxDecoration(
                  color: index == _selectedIndex ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [myBoxShadow],
                ),
                child: Center(
                  child: MyText(
                    text: movieGenere[index],
                    size: 14,
                    color: index == _selectedIndex ? Colors.white : kDarkGrey,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
