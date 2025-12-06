class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double rating;
  final String? releaseDate;
  final int? runtime;
  final List<String> genres;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.rating,
    this.releaseDate,
    this.runtime,
    required this.genres,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      rating: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e['name'] as String)
              .toList() ??
          [],
    );
  }
}
