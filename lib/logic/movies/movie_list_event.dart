// logic/movies/movie_list_event.dart
import 'package:equatable/equatable.dart';

abstract class MovieListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovies extends MovieListEvent {
  final bool isRefresh;
  final String query;

  FetchMovies({this.isRefresh = false, this.query = ''});

  @override
  List<Object?> get props => [isRefresh, query];
}

class LoadMoreMovies extends MovieListEvent {}
