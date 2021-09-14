import 'package:flutter/material.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/ui/components/movie_genre.dart';
import 'package:flutter_movie_app/ui/components/movie_list.dart';
import 'package:flutter_movie_app/ui/components/movie_type.dart';

import 'package:flutter_movie_app/ui/widgets/my_icons.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

import 'my_bottom_nav_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _selectedItem = 0;
  final PageController _myPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MyIcon(
                icon: Icons.double_arrow_rounded,
                size: 30,
                color: kDarkGrey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MyIcon(
                    icon: Icons.location_pin,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MyText(
                    text: "To, Canada",
                    size: 18,
                    color: kDarkGrey,
                  ),
                ],
              ),
              const MyIcon(
                icon: Icons.search,
                size: 30,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kSecondaryColor,
      bottomNavigationBar: MyBottomNavBar(
        selectedItem: _selectedItem,
        onChange: (value) {
          setState(() {
            _selectedItem = value;
            _myPageController.jumpToPage(_selectedItem);
          });
        },
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _myPageController,
        children: [
          //ExplorePage(),
          Column(
            children: [
              const VerticalSpacing(of: 1),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                child: SizedBox(
                    height: SizeConfig.getHeight(8), child: const MovieType()),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(8)),
                child: SizedBox(
                    height: SizeConfig.getHeight(8), child: const MovieGenre()),
              ),
              const VerticalSpacing(),
              const Expanded(child: MovieList()),
            ],
          ),
          const Center(
            child: MyText(
              text: 'Saves Will Appear here.',
              size: 24,
            ),
          ),
          const Center(
            child: MyText(
              text: 'User Profile Will Appear here.',
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
