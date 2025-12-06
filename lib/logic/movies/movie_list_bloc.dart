// logic/movies/movie_list_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';
import '../../data/services/api_service.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final ApiService apiService;

  MovieListBloc(this.apiService) : super(const MovieListState()) {
    on<FetchMovies>(_onFetchMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
  }

  Future<void> _onFetchMovies(
      FetchMovies event, Emitter<MovieListState> emit) async {
    emit(state.copyWith(
      status: MovieListStatus.loading,
      movies: event.isRefresh ? [] : state.movies,
      currentPage: 1,
      query: event.query,
      hasMore: true,
    ));

    try {
      final movies = await apiService.getPopularMovies(
        page: 1,
        query: event.query,
      );
      emit(state.copyWith(
        status: MovieListStatus.success,
        movies: movies,
        currentPage: 1,
        hasMore: movies.isNotEmpty,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadMoreMovies(
      LoadMoreMovies event, Emitter<MovieListState> emit) async {
    if (!state.hasMore || state.status == MovieListStatus.loadingMore) return;

    emit(state.copyWith(status: MovieListStatus.loadingMore));
    try {
      final nextPage = state.currentPage + 1;
      final movies = await apiService.getPopularMovies(
        page: nextPage,
        query: state.query,
      );
      emit(state.copyWith(
        status: MovieListStatus.success,
        movies: [...state.movies, ...movies],
        currentPage: nextPage,
        hasMore: movies.isNotEmpty,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: MovieListStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
