// logic/movies/movie_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';
import '../../data/services/api_service.dart';
import '../../data/services/local_storage_service.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final ApiService apiService;
  final LocalStorageService localStorage;
  final int movieId;

  MovieDetailBloc({
    required this.apiService,
    required this.localStorage,
    required this.movieId,
  }) : super(const MovieDetailState()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
    on<ToggleFavorite>(_onToggleFavorite);

    add(FetchMovieDetail(movieId));
  }

  Future<void> _onFetchMovieDetail(
      FetchMovieDetail event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(status: MovieDetailStatus.loading));
    try {
      final detail = await apiService.getMovieDetail(event.movieId);
      final isFav = await localStorage.isFavorite(event.movieId);
      emit(state.copyWith(
        status: MovieDetailStatus.success,
        detail: detail,
        isFavorite: isFav,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieDetailStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavorite event, Emitter<MovieDetailState> emit) async {
    final currentFav = state.isFavorite;
    await localStorage.toggleFavorite(movieId);
    emit(state.copyWith(isFavorite: !currentFav));
  }
}
