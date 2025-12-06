import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/movies/movie_list_bloc.dart';
import '../../logic/movies/movie_list_event.dart';
import '../../logic/movies/movie_list_state.dart';
import '../../data/services/api_service.dart';
import '../../data/services/local_storage_service.dart';

class LandingScreen extends StatefulWidget {
  final ApiService apiService;
  final LocalStorageService localStorageService;

  const LandingScreen({
    super.key,
    required this.apiService,
    required this.localStorageService,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MovieListBloc>().add(FetchMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Discovery"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                context.read<MovieListBloc>().add(FetchMovies(query: value));
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search movies...",
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<MovieListBloc, MovieListState>(
              builder: (context, state) {
                if (state.status == MovieListStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == MovieListStatus.error) {
                  return Center(child: Text("Error: ${state.errorMessage}"));
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<MovieListBloc>().add(FetchMovies(isRefresh: true));
                  },
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return ListTile(
                        leading: movie.posterPath != null
                            ? Image.network(
                                "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                                width: 60,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.movie),
                        title: Text(movie.title),
                        subtitle: Text(movie.releaseDate ?? "No date"),
                        onTap: () {
                          Navigator.pushNamed(context, "/details",
                              arguments: movie.id);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
