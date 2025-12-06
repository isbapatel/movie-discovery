import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/movie_model.dart';
import '../models/movie_detail_model.dart';

class ApiService {
  final http.Client client;
  ApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Movie>> getPopularMovies({int page = 1, String query = ''}) async {
    final uri = query.isEmpty
        ? Uri.parse('${ApiConstants.baseUrl}/movie/popular?api_key=${ApiConstants.apiKey}&page=$page')
        : Uri.parse('${ApiConstants.baseUrl}/search/movie?api_key=${ApiConstants.apiKey}&page=$page&query=$query');

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Movie.fromListJson(body['results']);
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/movie/$id?api_key=${ApiConstants.apiKey}&append_to_response=credits,reviews');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return MovieDetail.fromJson(body);
    } else {
      throw Exception('Failed to fetch movie detail');
    }
  }
}
