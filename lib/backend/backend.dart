import 'dart:convert';

import 'package:flutter_movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class BackEnd {
  static Future<bool> getMovies() async {
    const url = "https://www.omdbapi.com/?i=tt3896198&apikey=731dca2d";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body.toString());

      Movies.movies.add(MovieModel.fromMap(decodedData));

      return true;
    }
    return false;
  }
}
