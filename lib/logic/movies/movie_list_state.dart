// logic/movies/movie_list_state.dart
import 'package:equatable/equatable.dart';
import '../../data/models/movie_model.dart';

enum MovieListStatus { initial, loading, success, error, loadingMore }

class MovieListState extends Equatable {
  final MovieListStatus status;
  final List<Movie> movies;
  final String query;
  final int currentPage;
  final bool hasMore;
  final String? errorMessage;

  const MovieListState({
    this.status = MovieListStatus.initial,
    this.movies = const [],
    this.query = '',
    this.currentPage = 1,
    this.hasMore = true,
    this.errorMessage,
  });

  MovieListState copyWith({
    MovieListStatus? status,
    List<Movie>? movies,
    String? query,
    int? currentPage,
    bool? hasMore,
    String? errorMessage,
  }) {
    return MovieListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      query: query ?? this.query,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, movies, query, currentPage, hasMore, errorMessage];
}
