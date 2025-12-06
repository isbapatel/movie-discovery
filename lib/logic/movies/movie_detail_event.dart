// logic/movies/movie_detail_event.dart
import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovieDetail extends MovieDetailEvent {
  final int movieId;
  FetchMovieDetail(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class ToggleFavorite extends MovieDetailEvent {}
