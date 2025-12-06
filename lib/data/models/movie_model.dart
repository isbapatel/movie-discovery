class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double rating;
  final String? releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.rating,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      rating: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
    );
  }

  static List<Movie> fromListJson(List<dynamic> list) =>
      list.map((e) => Movie.fromJson(e)).toList();
}
