import 'package:flutter/material.dart';
import 'package:flutter_movie_app/backend/backend.dart';
import 'package:flutter_movie_app/configs/config.dart';
import 'package:flutter_movie_app/ui/components/explore_page.dart';
import 'package:flutter_movie_app/ui/widgets/my_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<bool> _myFuture;

  @override
  void initState() {
    _myFuture = BackEnd.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
        future: _myFuture,
        builder: (context, data) {
          if (data.hasError) {
            return const Scaffold(
              body: Center(
                child: MyText(
                    text:
                        "Something Went Wrong! Please Make Sure that You are connected to the Internet.",
                    size: 24),
              ),
            );
          } else if (data.hasData && data.data == true) {
            return const ExplorePage();
          } else if (data.data == false) {
            return const Scaffold(
              body: Center(
                child: MyText(
                    text:
                        "Something Went Wrong! Please Make Sure that You are connected to the Internet.",
                    size: 24),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            );
          }
        });
  }
}
