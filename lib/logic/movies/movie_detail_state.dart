// logic/movies/movie_detail_state.dart
import 'package:equatable/equatable.dart';
import '../../data/models/movie_detail_model.dart';

enum MovieDetailStatus { initial, loading, success, error }

class MovieDetailState extends Equatable {
  final MovieDetailStatus status;
  final MovieDetail? detail;
  final bool isFavorite;
  final String? errorMessage;

  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.detail,
    this.isFavorite = false,
    this.errorMessage,
  });

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetail? detail,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      detail: detail ?? this.detail,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, detail ?? '', isFavorite, errorMessage];
}

