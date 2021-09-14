class MovieModel {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;

  MovieModel(
      {required this.title,
      required this.year,
      required this.rated,
      required this.released,
      required this.runtime,
      required this.genre,
      required this.director,
      required this.writer,
      required this.actors,
      required this.plot,
      required this.language,
      required this.country,
      required this.awards,
      required this.poster,
      required this.metascore,
      required this.imdbRating,
      required this.imdbVotes,
      required this.imdbID,
      required this.type,
      required this.dvd,
      required this.boxOffice,
      required this.production});

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['Title'] ?? "NULL",
      year: map['Year'] ?? "NULL",
      rated: map['Rated'] ?? "NULL",
      released: map['Released'] ?? "NULL",
      runtime: map['Runtime'] ?? "NULL",
      genre: map['Genre'] ?? "NULL",
      director: map['Director'] ?? "NULL",
      writer: map['Writer'] ?? "NULL",
      actors: map['Actors'] ?? "NULL",
      plot: map['Plot'] ?? "NULL",
      language: map['Language'] ?? "NULL",
      country: map['Country'] ?? "NULL",
      awards: map['Awards'] ?? "NULL",
      poster: map['Poster'] ?? "NULL",
      metascore: map['Metascore'] ?? "NULL",
      imdbRating: map['imdbRating'] ?? "NULL",
      imdbVotes: map['imdbVotes'] ?? "NULL",
      imdbID: map['imdbID'] ?? "NULL",
      type: map['Type'] ?? "NULL",
      dvd: map['DVD'] ?? "NULL",
      boxOffice: map['BoxOffice'] ?? "NULL",
      production: map['Production'] ?? "NULL",
    );
  }
}

class Movies {
  static List<MovieModel> movies = [];
}
