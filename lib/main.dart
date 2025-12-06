import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/services/api_service.dart';
import 'data/services/local_storage_service.dart';

import 'logic/auth/auth_bloc.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/landing_screen.dart';
import 'presentation/screens/movie_detail_screen.dart';
import 'logic/movies/movie_list_bloc.dart';

void main() {
  final apiService = ApiService();
  final localStorageService = LocalStorageService();

  runApp(MyApp(
    apiService: apiService,
    localStorageService: localStorageService,
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  final LocalStorageService localStorageService;

  const MyApp({
    super.key,
    required this.apiService,
    required this.localStorageService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(localStorageService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Discovery App',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/login': (_) => const LoginScreen(),
          '/landing': (_) => BlocProvider(
                create: (_) => MovieListBloc(apiService),
                child: LandingScreen(
                  apiService: apiService,
                  localStorageService: localStorageService,
                ),
              ),
          '/details': (context) {
            final movieId =
                ModalRoute.of(context)!.settings.arguments as int;
            return MovieDetailScreen(
              movieId: movieId,
              apiService: apiService,
              localStorage: localStorageService,
            );
          },
        },
      ),
    );
  }
}
