import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/ui/screens/movie_details.dart';
import 'package:flutter_movie_app/ui/widgets/my_icons.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final movieList = Movies.movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MovieDetail(
                      movie: movieList[0],
                      index: index,
                    );
                  }));
                },
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffa9b4cf).withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: SizeConfig.getHeight(20),
                              width: SizeConfig.getWidth(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: SizeConfig.getHeight(15),
                                width: SizeConfig.getWidth(80),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: SizeConfig.getWidth(28),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.getWidth(52),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const VerticalSpacing(),
                                          MyText(
                                            text: movieList[0].title,
                                            size: 14,
                                            color: kDarkGrey,
                                            weight: FontWeight.w800,
                                          ),
                                          const VerticalSpacing(
                                            of: 0.5,
                                          ),
                                          MyText(
                                            text: movieList[0].genre,
                                            size: 14,
                                            color: kDarkGrey,
                                            weight: FontWeight.w600,
                                          ),
                                          const VerticalSpacing(
                                            of: 0.5,
                                          ),
                                          Row(
                                            children: [
                                              const MyIcon(
                                                  icon: Icons.star,
                                                  size: 14,
                                                  color: kPrimaryColor),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              MyText(
                                                text: movieList[0].imdbRating,
                                                size: 14,
                                                color: kDarkGrey,
                                                weight: FontWeight.w600,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: SizeConfig.getWidth(3),
                              bottom: SizeConfig.getWidth(6),
                              child: Hero(
                                tag: movieList[0].title + index.toString(),
                                child: Container(
                                    height: SizeConfig.getHeight(16),
                                    width: SizeConfig.getWidth(22),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          movieList[0].poster,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalSpacing(
                        of: 2,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
