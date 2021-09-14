import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/ui/widgets/my_icons.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpacing(
          of: 6,
        ),
        MyText(
          text: movie.title,
          size: 16,
          color: kDarkGrey,
          weight: FontWeight.w800,
        ),
        MyText(
          text: "Director: ${movie.director}",
          size: 14,
          color: kLightGrey,
          weight: FontWeight.w600,
        ),
        MyText(
          text: "Director: ${movie.runtime}",
          size: 14,
          color: kLightGrey,
          weight: FontWeight.w600,
        ),
        MyText(
          text: movie.genre,
          size: 14,
          color: kLightGrey,
          weight: FontWeight.w600,
        ),
        Row(
          children: [
            const MyIcon(icon: Icons.star, size: 16, color: kPrimaryColor),
            const SizedBox(
              width: 5,
            ),
            MyText(
              text: movie.imdbRating,
              size: 16,
              color: kLightGrey,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
