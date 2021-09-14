import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(2, (index) {
          return Container(
            height: SizeConfig.getHeight(8),
            width: SizeConfig.getWidth(38),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffa9b4cf).withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: SizeConfig.getHeight(1),
                ),
                Container(
                  height: SizeConfig.getHeight(6),
                  width: SizeConfig.getHeight(6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie.poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.getHeight(1),
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.getHeight(6),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: movie.actors.split(',')[index],
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.getHeight(1),
                ),
              ],
            ),
          );
        })
      ],
    );
  }
}
