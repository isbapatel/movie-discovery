import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/movies/movie_detail_bloc.dart';
import '../../logic/movies/movie_detail_event.dart';
import '../../logic/movies/movie_detail_state.dart';
import '../../data/services/api_service.dart';
import '../../data/services/local_storage_service.dart';
import '../../core/constants/api_constants.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;
  final ApiService apiService;
  final LocalStorageService localStorage;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.apiService,
    required this.localStorage,
  });

  @override
  Widget build(BuildContext context) {
    print("Movie ID received: $movieId");

    return BlocProvider(
      create: (_) => MovieDetailBloc(
        apiService: apiService,
        localStorage: localStorage,
        movieId: movieId,
      )..add(FetchMovieDetail(movieId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Details"),
        ),
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state.status == MovieDetailStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == MovieDetailStatus.error) {
              return Center(
                child: Text(
                  state.errorMessage ?? "Something went wrong!",
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }

            if (state.detail == null) {
              return const Center(child: Text("No details available"));
            }

            final detail = state.detail!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (detail.posterPath != null)
                    Center(
                      child: Hero(
                        tag: "movie_${detail.id}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "${ApiConstants.imageBaseUrl}${detail.posterPath}",
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    detail.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        detail.rating.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text("Release Date: ${detail.releaseDate ?? "--"}"),
                  const SizedBox(height: 6),
                  Text("Runtime: ${detail.runtime ?? 0} min"),
                  const SizedBox(height: 15),
                  const Text(
                    "Overview",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    detail.overview,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          state.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 32,
                        ),
                        onPressed: () {
                          context.read<MovieDetailBloc>().add(ToggleFavorite());
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
