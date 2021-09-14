import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:flutter_movie_app/ui/components/cast_widget.dart';
import 'package:flutter_movie_app/ui/components/movie_info.dart';
import 'package:flutter_movie_app/ui/widgets/button.dart';
import 'package:flutter_movie_app/ui/widgets/my_icons.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class MovieDetail extends StatelessWidget {
  final MovieModel movie;
  final int index;
  const MovieDetail({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        leadingWidth: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getWidth(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.getWidth(1.5)),
                    child: const MyIcon(
                      icon: Icons.arrow_back_ios_rounded,
                      size: 26,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.getWidth(1.5)),
                  child: const MyIcon(
                    icon: Icons.bookmark_outline_rounded,
                    size: 26,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: SizeConfig.getHeight(100),
            width: SizeConfig.getWidth(100),
            color: Colors.blue,
            child: Image.network(
              movie.poster,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8,
              sigmaY: 8,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          )),
          Positioned(
            bottom: 0,
            child: Container(
              height: SizeConfig.getHeight(75),
              width: SizeConfig.getWidth(100),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50), bottom: Radius.zero)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: SizeConfig.getHeight(84),
              width: SizeConfig.getWidth(80),
              child: Column(
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: movie.title + index.toString(),
                        child: Container(
                          height: SizeConfig.getHeight(26),
                          width: SizeConfig.getWidth(34),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              movie.poster,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.getWidth(4)),
                      SizedBox(
                        width: SizeConfig.getWidth(42),
                        height: SizeConfig.getHeight(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        SizeConfig.getWidth(1.5)),
                                    child: const MyIcon(
                                      icon: Icons.play_arrow,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            MovieInfo(movie: movie)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(of: 4),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          MyText(
                            text: "Plot Summary",
                            size: 22,
                            color: kDarkGrey,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const VerticalSpacing(of: 2),
                      MyText(
                        text: movie.plot,
                        size: 18,
                        color: kDarkGrey,
                      ),
                      const VerticalSpacing(of: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          MyText(
                            text: "Cast & Crew",
                            size: 20,
                            color: kDarkGrey,
                            weight: FontWeight.w700,
                          ),
                          MyText(
                            text: "View all",
                            size: 16,
                            color: kPrimaryColor,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const VerticalSpacing(of: 2),
                      CastWidget(movie: movie),
                      const VerticalSpacing(of: 2),
                      const MyButton(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
